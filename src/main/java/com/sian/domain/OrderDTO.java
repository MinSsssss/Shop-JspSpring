package com.sian.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class OrderDTO {
	private String order_no;
	private String mem_id;
	private String receiver_name;
	private String receiver_tel;
	private String receiver_addr1;
	private String receiver_addr2;
	private Date order_date;
	private String order_requset_msg;
	private String order_status;
	
	private int total_price;
	
	private List<OrderDetailDTO> orderDetailList;
}
