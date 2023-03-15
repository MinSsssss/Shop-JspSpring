package com.sian.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sian.common.page.Criteria;
import com.sian.product.dto.ProductDTO;


public interface ProductDAO {
	public void insert(ProductDTO productDTO) ;
	
	public List<ProductDTO> getList();

	public int getTotal(Criteria cri);
	
	public int getCategoryTotal(int category_no);
	
	public List<ProductDTO> getListPaging(Criteria cri);
	
	public List<ProductDTO> selectProductList(@Param("category_no")int category_no,
			@Param("pageNum") int pageNum,@Param("amount") int amount);
	
	public List<ProductDTO> memberProductList(int category_no) ;
	
	public ProductDTO getProduct(int product_no) ;
	
	public int getProductNo(String product_name);
	
	public void productModify(ProductDTO productDTO);
	
	public Long productReadCount(int product_no);
	
	public int productDelete(int product_no);
}
