package com.sian.product.dao;

import java.util.List;

import com.sian.product.dto.ProductAttachDTO;

public interface ProductAttachDAO {
	public void insert(ProductAttachDTO productAttachDTO);
	
	public void delete(String uuid);
	
	public List<ProductAttachDTO> findByProduct_no(int product_no);
}
