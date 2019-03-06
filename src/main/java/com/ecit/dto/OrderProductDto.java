package com.ecit.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.List;

/**
 * lyy
 */
@Setter
@Getter
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class OrderProductDto {
    private List<OrderItemDto> orderItemDtoList;
    private BigDecimal productTotalPrice;
    private String imageHost;

}
