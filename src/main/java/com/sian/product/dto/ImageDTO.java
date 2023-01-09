package com.sian.product.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageDTO {

    private int product_no;
    private String originalFileName; //클라이언트가 업로드한 파일이름
    private String storeFileName; //pk //uuid로 저장
    private String imgCategory; //이미지 카테고리 cover=c,book_imgs=i
    private String ext; //확장자
    private long size; //파일용량
    private Date regDate; //등록일

    public ImageDTO(int product_no,String originalFileName, String storedFileName, String imgCategory, String ext, long size) {
        this.product_no=product_no;
        this.originalFileName=originalFileName;
        this.storeFileName=storedFileName;
        this.imgCategory=imgCategory;
        this.ext=ext;
        this.size=size;
    }
}
