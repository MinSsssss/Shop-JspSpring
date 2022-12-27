package com.sian.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data

public class OrderDetailDTO {
	private String order_detail_no;
	private String order_no;
	
	private int product_no;
	private String product_name;
	private String order_qty;
	private String sub_total;
	
//	private List<String> product_nameArr;
//	private List<Integer> order_qtyArr;
//	private List<Integer> subTotalArr;
}
