package com.sian.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data

public class OrderDetailDTO {
	private Long order_detail_no;
	private Long order_no;
	
	private int product_no;
	private String product_name;
	private int order_qty;
	private int sub_total;
	
//	private List<String> product_nameArr;
//	private List<Integer> order_qtyArr;
//	private List<Integer> subTotalArr;
}
