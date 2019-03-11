package com.ecit.service.impl;

import com.alipay.api.AlipayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.demo.trade.config.Configs;
import com.alipay.demo.trade.model.ExtendParams;
import com.alipay.demo.trade.model.GoodsDetail;
import com.alipay.demo.trade.model.builder.AlipayTradePrecreateRequestBuilder;
import com.alipay.demo.trade.model.result.AlipayF2FPrecreateResult;
import com.alipay.demo.trade.service.AlipayTradeService;
import com.alipay.demo.trade.service.impl.AlipayTradeServiceImpl;
import com.alipay.demo.trade.utils.ZxingUtils;
import com.ecit.dto.*;
import com.ecit.service.IProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ecit.common.Const;
import com.ecit.common.ResponseData;
import com.ecit.dao.CartMapper;
import com.ecit.dao.OrderItemMapper;
import com.ecit.dao.OrderMapper;
import com.ecit.dao.PayInfoMapper;
import com.ecit.dao.ProductMapper;
import com.ecit.dao.ShippingMapper;
import com.ecit.bean.Cart;
import com.ecit.bean.Order;
import com.ecit.bean.OrderItem;
import com.ecit.bean.PayInfo;
import com.ecit.bean.Product;
import com.ecit.bean.Shipping;
import com.ecit.service.IOrderService;
import com.ecit.util.BigDecimalUtil;
import com.ecit.util.DateTimeUtil;
import com.ecit.util.FTPUtil;
import com.ecit.util.PropertiesUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * lyy
 */
@Service
public class OrderServiceImpl implements IOrderService {

    private static AlipayTradeService tradeService;

    static {

        /** 一定要在创建AlipayTradeService之前调用Configs.init()设置默认参数
         *  Configs会读取classpath下的zfbinfo.properties文件配置信息，如果找不到该文件则确认该文件是否在classpath目录
         */
        Configs.init("alipay.properties");

        /** 使用Configs提供的默认参数
         *  AlipayTradeService可以使用单例或者为静态成员对象，不需要反复new
         */
        tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();
    }

    private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private PayInfoMapper payInfoMapper;
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ShippingMapper shippingMapper;

    @Autowired
    private IProductService iProductService;


    public ResponseData createOrder(Integer userId, Integer shippingId) {

        //从购物车中获取数据
        List<Cart> cartList = cartMapper.selectCheckedCartByUserId(userId);

        //计算这个订单的总价
        ResponseData ResponseData = this.getCartOrderItem(userId, cartList);
        if (!ResponseData.isSuccess()) {
            return ResponseData;
        }
        List<OrderItem> orderItemList = (List<OrderItem>) ResponseData.getData();
        BigDecimal payment = this.getOrderTotalPrice(orderItemList);


        //生成订单
        Order order = this.assembleOrder(userId, shippingId, payment);
        if (order == null) {
            return ResponseData.fail("生成订单错误");
        }
        if (CollectionUtils.isEmpty(orderItemList)) {
            return ResponseData.fail("购物车为空");
        }
        for (OrderItem orderItem : orderItemList) {
            orderItem.setOrderNo(order.getOrderNo());
        }
        //mybatis 批量插入
        orderItemMapper.batchInsert(orderItemList);

        //生成成功,我们要减少我们产品的库存
        this.reduceProductStock(orderItemList);
        //清空一下购物车
        this.cleanCart(cartList);

        //返回给前端数据

        OrderDto orderDto = assembleOrderVo(order, orderItemList, null);
        return ResponseData.success(orderDto);
    }

    /**
     * 创建订单-虚拟
     *
     * @param userId
     * @param productId
     * @param quantity
     * @return
     */
    public ResponseData createOrder(Integer userId, Integer productId, Integer quantity) {

        //创建订单前，先查看该用户有没有创建过该商品的订单
        OrderItem orderItemTemp=new OrderItem();
        orderItemTemp.setUserId(userId)
                .setProductId(productId)
                .setQuantity(quantity);
        OrderItem orderItemToSearch= orderItemMapper.selectBySelective(orderItemTemp);
        if(orderItemToSearch!=null)
        {
            Order orderToSearch=orderMapper.selectByOrderNo(orderItemToSearch.getOrderNo());
            if(orderToSearch!=null&&orderToSearch.getOrderStatus().equals(Const.OrderStatusEnum.NO_PAY.getCode()))
            {
                Product productTemp = productMapper.selectByPrimaryKey(productId);

                ResponseData ResponseData = this.getCartOrderItem(userId, productTemp, quantity);
                if (!ResponseData.isSuccess()) {
                    return ResponseData;
                }
                List<OrderItem> orderItemListTemp = (List<OrderItem>) ResponseData.getData();
                OrderDto orderDtoTemp = assembleOrderVo(orderToSearch, orderItemListTemp, null);
                return ResponseData.success(orderDtoTemp);
            }

        }

        Product product = productMapper.selectByPrimaryKey(productId);

        ResponseData ResponseData = this.getCartOrderItem(userId, product, quantity);
        if (!ResponseData.isSuccess()) {
            return ResponseData;
        }
        List<OrderItem> orderItemList = (List<OrderItem>) ResponseData.getData();
        BigDecimal payment = this.getOrderTotalPrice(orderItemList);


        //生成订单
        Order order = this.assembleOrder(userId, productId, payment);
        if (order == null) {
            return ResponseData.fail("生成订单错误");
        }
        if (CollectionUtils.isEmpty(orderItemList)) {
            return ResponseData.fail("产品为空");
        }
        //特别场景，每次只生成一个订单
        if (orderItemList.size() == 1) {
            for (OrderItem orderItem : orderItemList) {
                orderItem.setOrderNo(order.getOrderNo());
            }
            //mybatis 批量插入
            orderItemMapper.batchInsert(orderItemList);
            OrderDto orderDto = assembleOrderVo(order, orderItemList, null);
            return ResponseData.success(orderDto);
        }
        return ResponseData.fail("生成订单错误");
    }

    private OrderDto assembleOrderVo(Order order, List<OrderItem> orderItemList, String orderStatus) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOrderNo(order.getOrderNo())
                .setPayment(order.getPayment())
                .setPaymentType(order.getPaymentType())
                .setPaymentTypeDesc(Const.PaymentTypeEnum.codeOf(order.getPaymentType()).getValue())
                .setPostage(order.getPostage())
                .setStatus(order.getOrderStatus())
                .setStatusDesc(order.getOrderStatus()==null?null:Const.OrderStatusEnum.codeOf(order.getOrderStatus()).getValue())
                .setShippingId(order.getShippingId());
        Shipping shipping = shippingMapper.selectByPrimaryKey(order.getShippingId());
        if (shipping != null) {
            orderDto.setReceiverName(shipping.getReceiverName())
                    .setShippingDto(assembleShippingVo(shipping));
        }

        orderDto.setPaymentTime(DateTimeUtil.dateToStr(order.getPaymentTime()))
                .setSendTime(DateTimeUtil.dateToStr(order.getSendTime()))
                .setEndTime(DateTimeUtil.dateToStr(order.getEndTime()))
                .setCreateTime(DateTimeUtil.dateToStr(order.getCreationDate()))
                .setCloseTime(DateTimeUtil.dateToStr(order.getCloseTime()))
                .setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));


        List<OrderItemDto> orderItemDtoList = Lists.newArrayList();
        for (OrderItem orderItem : orderItemList) {
            OrderItemDto orderItemDto = assembleOrderItemVo(orderItem, orderStatus);
            orderItemDtoList.add(orderItemDto);
        }
        orderDto.setOrderItemDtoList(orderItemDtoList);
        return orderDto;
    }


    private OrderItemDto assembleOrderItemVo(OrderItem orderItem, String orderStatus) {
        OrderItemDto orderItemDto = new OrderItemDto();
        orderItemDto.setOrderNo(orderItem.getOrderNo())
                .setProductId(orderItem.getProductId())
                .setProductName(orderItem.getProductName())
                .setProductImage(orderItem.getProductImage())
                .setCurrentUnitPrice(orderItem.getCurrentUnitPrice())
                .setQuantity(orderItem.getQuantity())
                .setTotalPrice(orderItem.getTotalPrice())
                .setCreateTime(DateTimeUtil.dateToStr(orderItem.getCreationDate()));
        if (orderItem.getUserId() != null && orderItem.getProductId() != null && orderStatus != null && orderStatus.equals(Const.OrderStatusEnum.PAID.getCode())) {
            Product p = productMapper.selectByPrimaryKey(orderItem.getProductId());
            orderItemDto.setAccount(p.getAccount()).setPassword(p.getPassword());
        }

        return orderItemDto;
    }


    private ShippingDto assembleShippingVo(Shipping shipping) {
        ShippingDto shippingDto = new ShippingDto();
        shippingDto.setReceiverName(shipping.getReceiverName())
                .setReceiverAddress(shipping.getReceiverAddress())
                .setReceiverProvince(shipping.getReceiverProvince())
                .setReceiverCity(shipping.getReceiverCity())
                .setReceiverDistrict(shipping.getReceiverDistrict())
                .setReceiverMobile(shipping.getReceiverMobile())
                .setReceiverZip(shipping.getReceiverZip())
                .setReceiverPhone(shippingDto.getReceiverPhone());
        return shippingDto;
    }

    private void cleanCart(List<Cart> cartList) {
        for (Cart cart : cartList) {
            cartMapper.deleteByPrimaryKey(cart.getCartId());
        }
    }


    private void reduceProductStock(List<OrderItem> orderItemList) {
        for (OrderItem orderItem : orderItemList) {
            Product product = productMapper.selectByPrimaryKey(orderItem.getProductId());
            product.setStock(product.getStock() - orderItem.getQuantity());
            productMapper.updateByPrimaryKeySelective(product);
        }
    }


    private Order assembleOrder(Integer userId, Integer ObjId, BigDecimal payment) {
        Order order = new Order();
        long orderNo = this.generateOrderNo();
        order.setOrderNo(orderNo);
        order.setOrderStatus(Const.OrderStatusEnum.NO_PAY.getCode());
        order.setPostage(0);
        order.setPaymentType(Const.PaymentTypeEnum.ONLINE_PAY.getCode());
        order.setPayment(payment);

        order.setUserId(userId);
        //产品id
        order.setShippingId(ObjId);
        //发货时间等等
        //付款时间等等
        int rowCount = orderMapper.insert(order);
        if (rowCount > 0) {
            return order;
        }
        return null;
    }


    private long generateOrderNo() {
        long currentTime = System.currentTimeMillis();
        return currentTime + new Random().nextInt(100);
    }


    private BigDecimal getOrderTotalPrice(List<OrderItem> orderItemList) {
        BigDecimal payment = new BigDecimal("0");
        for (OrderItem orderItem : orderItemList) {
            payment = BigDecimalUtil.add(payment.doubleValue(), orderItem.getTotalPrice().doubleValue());
        }
        return payment;
    }

    private ResponseData getCartOrderItem(Integer userId, List<Cart> cartList) {
        List<OrderItem> orderItemList = Lists.newArrayList();
        if (CollectionUtils.isEmpty(cartList)) {
            return ResponseData.fail("购物车为空");
        }

        //校验购物车的数据,包括产品的状态和数量
        for (Cart cartItem : cartList) {
            OrderItem orderItem = new OrderItem();
            Product product = productMapper.selectByPrimaryKey(cartItem.getProductId());
            if (Const.ProductStatusEnum.ON_SALE.getCode() != product.getStatus()) {
                return ResponseData.fail("产品" + product.getName() + "不是在线售卖状态");
            }

            //校验库存
            if (cartItem.getQuantity() > product.getStock()) {
                return ResponseData.fail("产品" + product.getName() + "库存不足");
            }

            orderItem.setUserId(userId);
            orderItem.setProductId(product.getProductId());
            orderItem.setProductName(product.getName());
            orderItem.setProductImage(product.getMainImage());
            orderItem.setCurrentUnitPrice(product.getPrice());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setTotalPrice(BigDecimalUtil.mul(product.getPrice().doubleValue(), cartItem.getQuantity()));
            orderItemList.add(orderItem);
        }
        return ResponseData.success(orderItemList);
    }

    private ResponseData getCartOrderItem(Integer userId, Product product, Integer quantity) {
        List<OrderItem> orderItemList = Lists.newArrayList();
        if (product == null) {
            return ResponseData.fail("产品为空");
        }

        //校验数据,包括产品的状态和 时长（其中时长暂时关闭）
        OrderItem orderItem = new OrderItem();
        if (Const.ProductStatusEnum.ON_SALE.getCode() != product.getStatus()) {
            return ResponseData.fail("产品" + product.getName() + "商品未上架");
        }
//            //校验时长
//            if(quantity < product.getStock()){
//                return ResponseData.fail("产品"+product.getName()+"时长低于最低时长");
//            }
        orderItem.setUserId(userId);
        orderItem.setProductId(product.getProductId());
        orderItem.setProductName(product.getName());
        orderItem.setProductImage(product.getMainImage());
        orderItem.setCurrentUnitPrice(product.getPrice());
        orderItem.setQuantity(quantity);
        orderItem.setTotalPrice(BigDecimalUtil.mul(product.getPrice().doubleValue(), quantity));
        orderItemList.add(orderItem);
        return ResponseData.success(orderItemList);
    }


    public ResponseData<String> cancel(Integer userId, Long orderNo) {
        Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        if (order == null) {
            return ResponseData.fail("该用户此订单不存在");
        }
        if (!order.getOrderStatus().equals(Const.OrderStatusEnum.NO_PAY.getCode())) {
            return ResponseData.fail("已付款,无法取消订单");
        }
        Order updateOrder = new Order();
        updateOrder.setOrderId(order.getOrderId());
        updateOrder.setOrderStatus(Const.OrderStatusEnum.CANCELED.getCode());

        int row = orderMapper.updateByPrimaryKeySelective(updateOrder);
        if (row > 0) {
            return ResponseData.success();
        }
        return ResponseData.fail();
    }


    public ResponseData getOrderCartProduct(Integer userId) {
        OrderProductDto orderProductDto = new OrderProductDto();
        //从购物车中获取数据

        List<Cart> cartList = cartMapper.selectCheckedCartByUserId(userId);
        ResponseData ResponseData = this.getCartOrderItem(userId, cartList);
        if (!ResponseData.isSuccess()) {
            return ResponseData;
        }
        List<OrderItem> orderItemList = (List<OrderItem>) ResponseData.getData();

        List<OrderItemDto> orderItemDtoList = Lists.newArrayList();

        BigDecimal payment = new BigDecimal("0");
        for (OrderItem orderItem : orderItemList) {
            payment = BigDecimalUtil.add(payment.doubleValue(), orderItem.getTotalPrice().doubleValue());
            orderItemDtoList.add(assembleOrderItemVo(orderItem, null));
        }
        orderProductDto.setProductTotalPrice(payment);
        orderProductDto.setOrderItemDtoList(orderItemDtoList);
        orderProductDto.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));
        return ResponseData.success(orderProductDto);
    }


    public ResponseData<OrderDto> getOrderDetail(Integer userId, Long orderNo) {
        Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        if (order != null) {
            List<OrderItem> orderItemList = orderItemMapper.getByOrderNoUserId(orderNo, userId);
            OrderDto orderDto = assembleOrderVo(order, orderItemList, null);
            return ResponseData.success(orderDto);
        }
        return ResponseData.fail("没有找到该订单");
    }


    public ResponseData<PageInfo> getOrderList(Integer userId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> orderList = orderMapper.selectByUserId(userId);
        List<OrderDto> orderDtoList = assembleOrderVoList(orderList, userId, null);
        PageInfo pageResult = new PageInfo(orderList);
        pageResult.setList(orderDtoList);
        return ResponseData.success(pageResult);
    }

    /**
     * 根据状态获取订单
     *
     * @param userId
     * @param pageNum
     * @param pageSize
     * @return
     */
    public ResponseData<PageInfo> getOrderList(Integer userId, String orderStatus, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> orderList = orderMapper.selectByUserIdAndStatus(userId, orderStatus);
        List<OrderDto> orderDtoList = assembleOrderVoList(orderList, userId, orderStatus);
        PageInfo pageResult = new PageInfo(orderList);
        pageResult.setList(orderDtoList);
        return ResponseData.success(pageResult);
    }

    private List<OrderDto> assembleOrderVoList(List<Order> orderList, Integer userId, String orderStatus) {
        List<OrderDto> orderDtoList = Lists.newArrayList();
        for (Order order : orderList) {
            List<OrderItem> orderItemList = Lists.newArrayList();
            if (userId == null) {
                //todo 管理员查询的时候 不需要传userId
                orderItemList = orderItemMapper.getByOrderNo(order.getOrderNo());
            } else {
                orderItemList = orderItemMapper.getByOrderNoUserId(order.getOrderNo(), userId);
            }
            OrderDto orderDto = assembleOrderVo(order, orderItemList, orderStatus);
            orderDtoList.add(orderDto);
        }
        return orderDtoList;
    }

    public ResponseData pay(Long orderNo, Integer userId, String path) {
        Map<String, String> resultMap = Maps.newHashMap();
        Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        if (order == null) {
            return ResponseData.fail("用户没有该订单");
        }
        resultMap.put("orderNo", String.valueOf(order.getOrderNo()));


        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
        String outTradeNo = order.getOrderNo().toString();


        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
        String subject = new StringBuilder().append("lyy_ecit扫码支付,订单号:").append(outTradeNo).toString();


        // (必填) 订单总金额，单位为元，不能超过1亿元
        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
        String totalAmount = order.getPayment().toString();


        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
        String undiscountableAmount = "0";


        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
        String sellerId = "";

        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
        String body = new StringBuilder().append("订单").append(outTradeNo).append("购买商品共").append(totalAmount).append("元").toString();


        // 商户操作员编号，添加此参数可以为商户操作员做销售统计
        String operatorId = "test_operator_id";

        // (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
        String storeId = "test_store_id";

        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
        ExtendParams extendParams = new ExtendParams();
        extendParams.setSysServiceProviderId("2088100200300400500");


        // 支付超时，定义为120分钟
        String timeoutExpress = "120m";

        // 商品明细列表，需填写购买商品详细信息，
        List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();

        List<OrderItem> orderItemList = orderItemMapper.getByOrderNoUserId(orderNo, userId);
        for (OrderItem orderItem : orderItemList) {
            GoodsDetail goods = GoodsDetail.newInstance(orderItem.getProductId().toString(), orderItem.getProductName(),
                    BigDecimalUtil.mul(orderItem.getCurrentUnitPrice().doubleValue(), new Double(100).doubleValue()).longValue(),
                    orderItem.getQuantity());
            goodsDetailList.add(goods);
        }

        // 创建扫码支付请求builder，设置请求参数
        AlipayTradePrecreateRequestBuilder builder = new AlipayTradePrecreateRequestBuilder()
                .setSubject(subject).setTotalAmount(totalAmount).setOutTradeNo(outTradeNo)
                .setUndiscountableAmount(undiscountableAmount).setSellerId(sellerId).setBody(body)
                .setOperatorId(operatorId).setStoreId(storeId).setExtendParams(extendParams)
                .setTimeoutExpress(timeoutExpress)
                .setNotifyUrl(PropertiesUtil.getProperty("alipay.callback.url"))//支付宝服务器主动通知商户服务器里指定的页面http路径,根据需要设置
                .setGoodsDetailList(goodsDetailList);


        AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);
        switch (result.getTradeStatus()) {
            case SUCCESS:
                logger.info("支付宝预下单成功: )");

                AlipayTradePrecreateResponse response = result.getResponse();
                dumpResponse(response);

                File folder = new File(path);
                if (!folder.exists()) {
                    folder.setWritable(true);
                    folder.mkdirs();
                }

                // 需要修改为运行机器上的路径
                //细节细节细节
                String qrPath = String.format(path + "/qr-%s.png", response.getOutTradeNo());
                String qrFileName = String.format("qr-%s.png", response.getOutTradeNo());
                ZxingUtils.getQRCodeImge(response.getQrCode(), 256, qrPath);

                File targetFile = new File(path, qrFileName);
                try {
                    FTPUtil.uploadFile(Lists.newArrayList(targetFile));
                } catch (IOException e) {
                    logger.error("上传二维码异常", e);
                }
                logger.info("qrPath:" + qrPath);
                String qrUrl = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFile.getName();
                resultMap.put("qrUrl", qrUrl);
                return ResponseData.success(resultMap);
            case FAILED:
                logger.error("支付宝预下单失败!!!");
                return ResponseData.fail("支付宝预下单失败!!!");

            case UNKNOWN:
                logger.error("系统异常，预下单状态未知!!!");
                return ResponseData.fail("系统异常，预下单状态未知!!!");

            default:
                logger.error("不支持的交易状态，交易返回异常!!!");
                return ResponseData.fail("不支持的交易状态，交易返回异常!!!");
        }

    }

    // 简单打印应答
    private void dumpResponse(AlipayResponse response) {
        if (response != null) {
            logger.info(String.format("code:%s, msg:%s", response.getCode(), response.getMsg()));
            if (StringUtils.isNotEmpty(response.getSubCode())) {
                logger.info(String.format("subCode:%s, subMsg:%s", response.getSubCode(),
                        response.getSubMsg()));
            }
            logger.info("body:" + response.getBody());
        }
    }


    public ResponseData aliCallback(Map<String, String> params) {
        Long orderNo = Long.parseLong(params.get("out_trade_no"));
        String tradeNo = params.get("trade_no");
        String tradeStatus = params.get("trade_status");
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order == null) {
            return ResponseData.fail("非程序的订单,回调忽略");
        }
        String status = order.getOrderStatus();
        if (status.equals("PAID") || status.equals("SHIPPED") || status.equals("ORDER_SUCCESS") || status.equals("ORDER_CLOSE")) {
            return ResponseData.success("支付宝重复调用");
        }
        if (Const.AlipayCallback.TRADE_STATUS_TRADE_SUCCESS.equals(tradeStatus)) {
            order.setPaymentTime(DateTimeUtil.strToDate(params.get("gmt_payment")));
            order.setOrderStatus(Const.OrderStatusEnum.PAID.getCode());
            orderMapper.updateByPrimaryKeySelective(order);
        }

        PayInfo payInfo = new PayInfo();
        payInfo.setUserId(order.getUserId())
                .setOrderNo(order.getOrderNo())
                .setPayPlatform(Const.PayPlatformEnum.ALIPAY.getCode())
                .setPlatformNumber(tradeNo)
                .setPlatformStatus(tradeStatus);

        payInfoMapper.insert(payInfo);

        return ResponseData.success();
    }


    public ResponseData queryOrderPayStatus(Integer userId, Long orderNo) {
        Order order = orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
        if (order == null) {
            return ResponseData.fail("用户没有该订单");
        }
        String status = order.getOrderStatus();

        if (status.equals("PAID") || status.equals("SHIPPED") || status.equals("ORDER_SUCCESS") || status.equals("ORDER_CLOSE")) {
            return ResponseData.success();
        }
        return ResponseData.fail();
    }

    //backend

    public ResponseData<PageInfo> manageList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> orderList = orderMapper.selectAllOrder();
        List<OrderDto> orderDtoList = this.assembleOrderVoList(orderList, null, null);
        PageInfo pageResult = new PageInfo(orderList);
        pageResult.setList(orderDtoList);
        return ResponseData.success(pageResult);
    }


    public ResponseData<OrderDto> manageDetail(Long orderNo) {
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order != null) {
            List<OrderItem> orderItemList = orderItemMapper.getByOrderNo(orderNo);
            OrderDto orderDto = assembleOrderVo(order, orderItemList, null);
            return ResponseData.success(orderDto);
        }
        return ResponseData.fail("订单不存在");
    }

    public ResponseData<PageInfo> manageSearch(Long orderNo, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order != null) {
            List<OrderItem> orderItemList = orderItemMapper.getByOrderNo(orderNo);
            OrderDto orderDto = assembleOrderVo(order, orderItemList, null);

            PageInfo pageResult = new PageInfo(Lists.newArrayList(order));
            pageResult.setList(Lists.newArrayList(orderDto));
            return ResponseData.success(pageResult);
        }
        return ResponseData.fail("订单不存在");
    }


    public ResponseData<String> manageSendGoods(Long orderNo) {
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order != null) {
            if (!order.getOrderStatus().equals(Const.OrderStatusEnum.PAID.getCode())) {
                order.setOrderStatus(Const.OrderStatusEnum.SHIPPED.getCode());
                order.setSendTime(new Date());
                orderMapper.updateByPrimaryKeySelective(order);
                return ResponseData.success("发货成功");
            }
        }
        return ResponseData.fail("订单不存在");
    }

    /**
     * 更新指定订单
     *
     * @param userId
     * @param orderNo
     * @return
     */
    public ResponseData updateOrderInfo(Integer userId, Long orderNo) {
        if (orderNo == null || userId == null) {
            ResponseData.fail("参数有误");
        }
        Order order = orderMapper.selectByOrderNo(orderNo);
        if (order != null) {
            if (order.getUserId() != userId) {
                return ResponseData.fail("非本人订单");
            }
            //加强校验,当订单为已支付状态PAID时，才更新
            if (order.getOrderStatus().equals(Const.OrderStatusEnum.PAID.getCode())) {
                List<OrderItem> orderItemList = orderItemMapper.getByOrderNoUserId(orderNo, userId);
                //目前数据均为单数据信息
                if (orderItemList.size() != 1) {
                    return ResponseData.fail("数据非单数据信息");
                }
                OrderItem orderItem = orderItemList.get(0);
                //组装新的数据更新
                order.setPayment(orderItem.getTotalPrice())
                        .setPaymentTime(orderItem.getCreationDate())
                        .setEndTime(DateTimeUtil.addTime(new Date(), orderItem.getQuantity()));
                int rowNum = orderMapper.updateByPrimaryKeySelective(order);
                if (rowNum > 0) {
                    //再更新产品状态
                    ResponseData responseData = iProductService.setSaleStatus(orderItem.getProductId(), Const.ProductStatusEnum.RENTING.getCode());
                    return responseData;

                }
                return ResponseData.fail();


            } else {
                return ResponseData.fail("订单状态不是已支付状态");
            }

        }
        return ResponseData.fail();
    }


    /**
     * 完成订单
     *
     * @param params
     * @return
     */
    public ResponseData finishOrder(Map<String, Object> params) {

        //获取订单号 orderNo
        Long orderNo = (Long) params.get("orderNo");

        List<OrderItem> orderItemList = orderItemMapper.getByOrderNo(orderNo);
        if (orderItemList.size() != 1) {
            ResponseData.fail("订单有误");
        }
        OrderItem orderItem = orderItemList.get(0);
        //修改订单状态为完成
        Order order = orderMapper.selectByOrderNo(orderNo);
        order.setOrderStatus(Const.OrderStatusEnum.ORDER_SUCCESS.getCode());
        int rowNum = orderMapper.updateByPrimaryKeySelective(order);
        if (rowNum > 0) {
            //修改产品为上架状态
            Product product = productMapper.selectByPrimaryKey(orderItem.getProductId());
            product.setStatus(Const.ProductStatusEnum.ON_SALE.getCode());
            int row = productMapper.updateByPrimaryKeySelective(product);
            if (row > 0) {
                ResponseData.success("订单已完成,产品已改为上架状态");
            }
        }
        return ResponseData.fail();
    }
}
