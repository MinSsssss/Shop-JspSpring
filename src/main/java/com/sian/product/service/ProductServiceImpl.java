package com.sian.product.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sian.cart.service.CartService;
import com.sian.common.page.Criteria;
import com.sian.member.service.MemberService;
import com.sian.product.dao.ProductAttachDAO;
import com.sian.product.dao.ProductDAO;
import com.sian.product.dto.ProductAttachDTO;
import com.sian.product.dto.ProductDTO;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {
	
	private final ProductDAO productDAO;
	
	private final ProductAttachDAO productAttachDAO;
	
	@Override
	public List<ProductDTO> memberProductList(int category_no) {
		
		return productDAO.memberProductList(category_no);
	}
	@Override
	public int getTotal(Criteria cri) {
		
		return productDAO.getTotal(cri);
	}
	@Override
	public int getTotal(int category_no) {
		System.out.println("category2 : " + category_no);
		return productDAO.getCategoryTotal(category_no);
	}
	
	@Override
	public List<ProductDTO> productList(Criteria cri) {
		
		return productDAO.getListPaging(cri);
	}
	
	@Override
	public List<ProductDTO> productList(int category_no, Criteria cri) {
		System.out.println("category3 : " + category_no);
		return productDAO.selectProductList(category_no,cri.getPageNum(),cri.getAmount()) ;
	}
	
	@Override
	public ProductDTO getProduct(int product_no) {
		
		return productDAO.getProduct(product_no);
	}
	@Override
	public int getProductNo(String product_name){
		
		return productDAO.getProductNo(product_name);
	}
	
	@Transactional
	@Override
	public void productRegister(ProductDTO productDTO)  {
		int i=0;
		productDAO.insert(productDTO);
		
		
		if(productDTO.getAttachList() == null || productDTO.getAttachList().size() <= 0) {
			return;
		}
		productDTO.getAttachList().forEach(attach -> {
			attach.setProduct_no(productDTO.getProduct_no());
			productAttachDAO.insert(attach);
		});
		i++;
		if(i==2) {
			System.out.println("두번실행되나?"+i);
		}
		
	}

	@Override
	public List<ProductDTO> getProductList()  {
	
		return productDAO.getList();
	}
	@Override
	public List<ProductAttachDTO> getAttachList(int product_no) {
		
		return productAttachDAO.findByProduct_no(product_no);
	}
	@Transactional
	@Override
	public void productModify(ProductDTO productDTO) {
		if(productDTO.getAttachList() == null || productDTO.getAttachList().size() <= 0) {
			return;
		}
		System.out.println("productNO : " + productDTO.getProduct_no());
		getAttachList(productDTO.getProduct_no())
	 	.forEach(attach->{
	 				productAttachDAO.delete(attach.getUuid());
	 			}
	 		);
		
		productDTO.getAttachList().forEach(attach -> {
			attach.setProduct_no(productDTO.getProduct_no());
			productAttachDAO.insert(attach);
		});
		
		productDAO.productModify(productDTO);
	}
	@Override
	public List<String> imgList(int product_no){
	 	
		String imgFullPath = "";

		List<ProductAttachDTO> paDTO = getAttachList(product_no);
		List<String> images = new ArrayList<String>();
		List<String> originImages = new ArrayList<String>();
		
		for (int i = 0; i < paDTO.size(); i++) {

			try {
				imgFullPath = URLEncoder.encode(paDTO.get(i).getUploadPath() + "/s_" + paDTO.get(i).getUuid() + "_"
						+ paDTO.get(i).getFileName(), "UTF-8");

				images.add(imgFullPath);
				
				imgFullPath = URLEncoder.encode(paDTO.get(i).getUploadPath() + paDTO.get(i).getUuid() + "_"
						+ paDTO.get(i).getFileName(), "UTF-8");

				originImages.add(imgFullPath);
				
			} catch (UnsupportedEncodingException e) {

				e.printStackTrace();
			}	

		}
		return images;
 }
	@Override
	public List<String> originImgList(int product_no){
	 	
		String imgFullPath = "";

		List<ProductAttachDTO> paDTO = getAttachList(product_no);
		List<String> originImages = new ArrayList<String>();
		
		for (int i = 0; i < paDTO.size(); i++) {

			try {

				imgFullPath = URLEncoder.encode(paDTO.get(i).getUploadPath() + "/" + paDTO.get(i).getUuid() + "_"
						+ paDTO.get(i).getFileName(), "UTF-8");

				originImages.add(imgFullPath);
				
			} catch (UnsupportedEncodingException e) {

				e.printStackTrace();
			}	

		}
		return originImages;
 }
	@Override
	public long productReadCount(int product_no) {
		
		return productDAO.productReadCount(product_no);
	}
	
	
	
	

}
