package com.sian.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {
	private String order_detail_no;
	private String order_no;
	private int product_no;
	private int order_qty;
	private int sub_total;
	
	private List<OrderDetailDTO> orderDetailDTOList;
}
