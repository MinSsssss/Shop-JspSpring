package com.sian.order.dto;

import lombok.Data;

@Data
public class CourierDTO {
	private Long order_no;
	private String courier_code;
	private String courier_name;
	private Long invoice_no;
}
