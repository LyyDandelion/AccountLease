package com.ecit.service.impl;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.dao.CartMapper;
import com.ecit.dao.ProductMapper;
import com.ecit.bean.Cart;
import com.ecit.bean.Product;
import com.ecit.service.ICartService;
import com.ecit.util.BigDecimalUtil;
import com.ecit.util.PropertiesUtil;
import com.ecit.dto.CartProductDto;
import com.ecit.dto.CartDto;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartServiceImpl implements ICartService {

    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;

    public ResponseData<CartDto> add(Integer userId, Integer productId, Integer count){
        if(productId == null || count == null){
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT,"非法参数");
        }


        Cart cart = cartMapper.selectCartByUserIdProductId(userId,productId);
        if(cart == null){
            //这个产品不在这个购物车里,需要新增一个这个产品的记录
            Cart cartItem = new Cart();
            cartItem.setQuantity(count);
            cartItem.setChecked(Const.Cart.CHECKED);
            cartItem.setProductId(productId);
            cartItem.setUserId(userId);
            cartMapper.insert(cartItem);
        }else{
            //这个产品已经在购物车里了.
            //如果产品已存在,数量相加
            count = cart.getQuantity() + count;
            cart.setQuantity(count);
            cartMapper.updateByPrimaryKeySelective(cart);
        }
        return this.list(userId);
    }

    public ResponseData<CartDto> update(Integer userId, Integer productId, Integer count){
        if(productId == null || count == null){
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT,"ILLEGAL_ARGUMENT");
        }
        Cart cart = cartMapper.selectCartByUserIdProductId(userId,productId);
        if(cart != null){
            cart.setQuantity(count);
        }
        cartMapper.updateByPrimaryKey(cart);
        return this.list(userId);
    }

    public ResponseData<CartDto> deleteProduct(Integer userId, String productIds){
        List<String> productList = Splitter.on(",").splitToList(productIds);
        if(CollectionUtils.isEmpty(productList)){
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT,"ILLEGAL_ARGUMENT");
        }
        cartMapper.deleteByUserIdProductIds(userId,productList);
        return this.list(userId);
    }


    public ResponseData<CartDto> list (Integer userId){
        CartDto cartDto = this.getCartVoLimit(userId);
        return ResponseData.success(cartDto);
    }

    @Override
    public ResponseData<CartDto> selectOrUnSelect (Integer userId, Integer productId, String checked){
        cartMapper.checkedOrUncheckedProduct(userId,productId,checked);
        return this.list(userId);
    }

    public ResponseData<Integer> getCartProductCount(Integer userId){
        if(userId == null){
            return ResponseData.success(0);
        }
        return ResponseData.success(cartMapper.selectCartProductCount(userId));
    }
    private CartDto getCartVoLimit(Integer userId){
        CartDto cartDto = new CartDto();
        List<Cart> cartList = cartMapper.selectCartByUserId(userId);
        List<CartProductDto> cartProductDtoList = Lists.newArrayList();

        BigDecimal cartTotalPrice = new BigDecimal("0");

        if(CollectionUtils.isNotEmpty(cartList)){
            for(Cart cartItem : cartList){
                CartProductDto cartProductDto = new CartProductDto();
                cartProductDto.setId(cartItem.getCartId())
                        .setUserId(userId)
                         .setProductId(cartItem.getProductId());

                Product product = productMapper.selectByPrimaryKey(cartItem.getProductId());
                if(product != null){
                    cartProductDto.setProductMainImage(product.getMainImage())
                            .setProductName(product.getName())
                            .setProductSubtitle(product.getSubtitle())
                            .setProductStatus(product.getStatus())
                            .setProductPrice(product.getPrice())
                            .setProductStock(product.getStock());
                    //判断库存
                    int buyLimitCount = 0;
                    if(product.getStock() >= cartItem.getQuantity()){
                        //库存充足的时候
                        buyLimitCount = cartItem.getQuantity();
                        cartProductDto.setLimitQuantity(Const.Cart.LIMIT_NUM_SUCCESS);
                    }else{
                        buyLimitCount = product.getStock();
                        cartProductDto.setLimitQuantity(Const.Cart.LIMIT_NUM_FAIL);
                        //购物车中更新有效库存
                        Cart cartForQuantity = new Cart();
                        cartForQuantity.setCartId(cartItem.getCartId())
                        .setQuantity(buyLimitCount);
                        cartMapper.updateByPrimaryKeySelective(cartForQuantity);
                    }
                    cartProductDto.setQuantity(buyLimitCount)
                    //计算总价
                    .setProductTotalPrice(BigDecimalUtil.mul(product.getPrice().doubleValue(), cartProductDto.getQuantity()))
                    .setProductChecked(cartItem.getChecked());
                }

                if(cartItem.getChecked() == Const.Cart.CHECKED){
                    //如果已经勾选,增加到整个的购物车总价中
                    cartTotalPrice = BigDecimalUtil.add(cartTotalPrice.doubleValue(), cartProductDto.getProductTotalPrice().doubleValue());
                }
                cartProductDtoList.add(cartProductDto);
            }
        }
        cartDto.setCartTotalPrice(cartTotalPrice)
        .setCartProductDtoList(cartProductDtoList)
        .setAllChecked(this.getAllCheckedStatus(userId))
        .setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));

        return cartDto;
    }

    private boolean getAllCheckedStatus(Integer userId){
        if(userId == null){
            return false;
        }
        return cartMapper.selectCartProductCheckedStatusByUserId(userId) == 0;

    }
}
