package com.sian.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data

public class OrderDetailDTO {
	private Long order_detail_no;
	private Long de_order_no;
	private int order_qty;
	private int sub_total;
	
	private int product_no;
	private String product_name;
	private String product_image1;
	private int product_price;
//	private List<String> product_nameArr;
//	private List<Integer> order_qtyArr;
//	private List<Integer> subTotalArr;
}
