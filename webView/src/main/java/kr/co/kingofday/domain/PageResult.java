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

	public int getListList() {
		return listList;
	}

	public void setListList(int listList) {
		this.listList = listList;
	}

	public int getTabSize() {
		return tabSize;
	}

	public void setTabSize(int tabSize) {
		this.tabSize = tabSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public int getUserUniqueID() {
		return userUniqueID;
	}

	public void setUserUniqueID(int userUniqueID) {
		this.userUniqueID = userUniqueID;
	}

	@Override
	public String toString() {
		return "PageResult [listList=" + listList + ", tabSize=" + tabSize + ", pageNo=" + pageNo + ", count=" + count
				+ ", lastPage=" + lastPage + ", beginPage=" + beginPage + ", endPage=" + endPage + ", prev=" + prev
				+ ", next=" + next + ", countryCode=" + countryCode + ", userUniqueID=" + userUniqueID + "]";
	}
}
