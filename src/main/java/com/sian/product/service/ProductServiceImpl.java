package com.sian.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sian.product.dao.ProductDAO;
import com.sian.product.dto.ProductDTO;

import lombok.Setter;
@Service
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	
	@Override
	public List<ProductDTO> memberProductList(int category_no) {
		
		return productDAO.memberProductList(category_no);
	}
	@Override
	public ProductDTO getProduct(int product_no) {
		
		return productDAO.getProduct(product_no);
	}
	@Override
	public int getProductNo(String product_name){
		
		return productDAO.getProductNo(product_name);
	}
	
	@Override
	public void productRegister(ProductDTO productDTO)  {
		productDAO.insert(productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList()  {
		
		return productDAO.getList();
	}
	

}
