package com.sian.common.page;



import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage; //페이지 첫번쨰 번호
	private int endPage; //페이지의 끝번호
	private boolean prev,next;
	
	private int total; //총데이터수
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		System.out.println("cri : " + cri);
		//페이징의 끝번호 계산
		
		this.endPage = (int)(Math.ceil((cri.getPageNum()+1)/25.0))*5;
		System.out.println("엔드페이지" + this.endPage);
		//페이징의 시작번호 계산
		this.startPage = this.endPage-4;
		System.out.println("시작페이지" + this.startPage);
		//페이징의 마지막번호
		int realEnd = (int)(Math.ceil((total *1.0)/cri.getAmount()));
		
		System.out.println("리얼엔드 : " + realEnd);
		
		
		if(realEnd<this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
