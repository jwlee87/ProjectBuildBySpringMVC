package kr.co.kingofday.domain;

public class SearchNDB {
	
	///Filed
	private int page;
	private int totalCount;
	//표시될 페이지 탭의 갯수
	private int countPage = 5;
	private int countList = 10;
	private int startPage;
	private int endPage;
	private int startCount;
	private int endCount;
	private int totalPage;
	
	private boolean prev;
	private boolean next;
	
	private String keyword;
	
	///Contructor
	public SearchNDB() {
	}
	public SearchNDB(int page, int totalCount) {
		this.page = page;
		this.totalCount = totalCount;
		init();
	}
	public SearchNDB(int page, int totalCount, int countPage, int countList) {
		this.page = page;
		this.totalCount = totalCount;
		this.countPage = countPage;
		this.countList = countList;
		init();
	}
	public SearchNDB(int page, int totalCount, String keyword) {
		this.page = page;
		this.totalCount = totalCount;
		this.keyword = keyword;
		init();
	}
	
	private void init() {
		startCount = (page-1)*countList+1;
		endCount = page*countList;
		
		totalPage = totalCount / countList;
		if(totalCount % countList > 0) {
			totalPage++;
		}
		if( totalPage < page ) {
			page = totalPage;
		}
		startPage = ((page-1)/countPage)*countPage+1;
		endPage = startPage+countPage-1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		prev = page != 1;
		next = page != totalPage;
	}
	
	///Method
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
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
	@Override
	public String toString() {
		return "SearchNDB [page=" + page + ", totalCount=" + totalCount + ", countPage=" + countPage + ", countList="
				+ countList + ", startPage=" + startPage + ", endPage=" + endPage + ", startCount=" + startCount
				+ ", endCount=" + endCount + ", totalPage=" + totalPage + ", prev=" + prev + ", next=" + next
				+ ", keyword=" + keyword + "]";
	}
}