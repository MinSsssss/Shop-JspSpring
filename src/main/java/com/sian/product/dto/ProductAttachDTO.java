package com.sian.product.dto;

import lombok.Data;

@Data
public class ProductAttachDTO {
	  private String uuid;
	  private String uploadPath;
	  private String fileName;
	  private boolean fileType;
	  
	  private int product_no;
}
