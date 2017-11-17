package kr.co.kingofday.domain;

import org.springframework.beans.factory.annotation.Value;

public class PageResult {
	
	//한페이지에 표시될 게시글 수
	@Value("#{commonProperties['countList']}")
	private int listList;
	//표시될 페이지 탭의 갯수
	@Value("#{commonProperties['countPage']}")
	private int tabSize;
	private int pageNo;
	private int count;
	private int lastPage;
	private int beginPage;
	private int endPage;
	
	private boolean prev;
	private boolean next;
	
	private int countryCode;
	private int userUniqueID;
	
	public PageResult(int pageNo, int count, int countryCode, int userUniqueID) {
		this.count = count;
		this.pageNo = pageNo;
		init();
	}
	
	private void init() {
		
		beginPage = ((pageNo-1)/listList)*listList+1;
		
	}
	
}
