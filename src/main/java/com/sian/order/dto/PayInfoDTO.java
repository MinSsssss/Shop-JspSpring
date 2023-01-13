package com.sian.order.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PayInfoDTO {
	public Long pay_no;
	public String mem_id;
	public Long order_no;
	public String pay_method;
	public String pay_name;
	public Long pay_amount;
}
