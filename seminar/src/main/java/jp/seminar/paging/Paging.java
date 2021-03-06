package jp.seminar.paging;


public class Paging {
	private int totalCount = 0 ; 
	private int totalPage = 0 ; 
	
	private int pageNumber = 0 ; 
	private int pageSize = 0 ; 
	private int beginRow = 0 ;
	private int endRow = 0 ; 
	
	private int pageCount = 10 ; 
	private int beginPage = 0 ; 
	private int endPage = 0 ; 
	
	private String url = "" ; 
	private String pagingHtml = "";
	private String pagingStatus = ""; 
	
	private String type = "";
	private String value = "";
	
	private String order = "";
	
	public Paging(String _pageNumber, String _pageSize, int totalCount, String url) {		
		this.pageNumber = _pageNumber == null ? 1 : Integer.parseInt( _pageNumber ) ;
		this.pageSize = _pageSize == null ? 10 : Integer.parseInt( _pageSize ) ;
		this.totalCount = totalCount ;
		this.url = url ;
		
		beginRow = (pageNumber - 1 ) * pageSize   ; 
		endRow = pageNumber * pageSize   ;
		
		totalPage = (int)(Math.ceil((double)totalCount / pageSize)) ;		
		beginPage = (pageNumber-1)/pageCount*pageCount  + 1 ;
		if( beginPage < 0 ){ beginPage = 1 ; }
		endPage = beginPage + pageCount - 1 ;
		if( endPage > totalPage ){ endPage = totalPage ; }
		
		pagingHtml = "<br>"+ getPagingHtml( url ); 
		
		pagingStatus = "" + beginPage + "-" +
			endPage + "[" +  pageNumber + "/" + totalPage + "]" ;
		 //1-10(2/100)
		
	}
	
	public Paging(String _pageNumber, String _pageSize, int totalCount, String url, String order) {		
		this.pageNumber = _pageNumber == null ? 1 : Integer.parseInt( _pageNumber ) ;
		this.pageSize = _pageSize == null ? 10 : Integer.parseInt( _pageSize ) ;
		this.totalCount = totalCount ;
		this.url = url ;
		
		beginRow = (pageNumber - 1 ) * pageSize   ; 
		endRow = pageNumber * pageSize   ;
		
		totalPage = (int)(Math.ceil((double)totalCount / pageSize)) ;		
		beginPage = (pageNumber-1)/pageCount*pageCount  + 1 ;
		if( beginPage < 0 ){ beginPage = 1 ; }
		endPage = beginPage + pageCount - 1 ;
		if( endPage > totalPage ){ endPage = totalPage ; }
		
		pagingHtml = "<br>"+ getPagingHtml( url, order ); 
		
		pagingStatus = "" + beginPage + "-" +
			endPage + "[" +  pageNumber + "/" + totalPage + "]" ;
		 //1-10(2/100)
		
	}
	
	public Paging(String _pageNumber, String _pageSize, int totalCount, String url, String type, String value) {		
		this.pageNumber = _pageNumber == null ? 1 : Integer.parseInt( _pageNumber ) ;
		this.pageSize = _pageSize == null ? 10 : Integer.parseInt( _pageSize ) ;
		this.totalCount = totalCount ;
		this.url = url ;
		
		this.type = type;
		this.value = value;
		
		beginRow = (pageNumber - 1 ) * pageSize   ; 
		endRow = pageNumber * pageSize   ;
		
		totalPage = (int)(Math.ceil((double)totalCount / pageSize)) ;		
		beginPage = (pageNumber-1)/pageCount*pageCount  + 1 ;
		if( beginPage < 0 ){ beginPage = 1 ; }
		endPage = beginPage + pageCount - 1 ;
		if( endPage > totalPage ){ endPage = totalPage ; }
		
		pagingHtml = "<br>"+ getPagingHtml( url , type, value); 
		
		pagingStatus = "" + beginPage + "-" +
			endPage + "[" +  pageNumber + "/" + totalPage + "]" ;
		 //1-10(2/100)
		
	}
	


	private String getPagingHtml( String url ){ 
		String result = "" ;
		if ( pageNumber <= pageCount ) {
			result += "<li><a href='#'>&laquo;</a></li>";			
		} else {
			result += "<li><a href='" + url + "?pageNumber=" + (beginPage - 1) + 
					"&pageSize=" + pageSize + "'>&laquo;</a></li>";
		}		
		
		for (int i = beginPage ; i <= endPage ; i++) {
			if(i == pageNumber){ 
				result += "<li class=\"active\"><a href='" + url + "?pageNumber=" + i + 
					"&pageSize=" + pageSize + "' >" + i + "</a></li>";
			}else{
				result += "<li><a href='" + url + "?pageNumber=" + i + 
					"&pageSize=" + pageSize + "' >" + i + "</a></li>";	
			}			
		}		
		if ( pageNumber >= (totalPage / pageCount * pageCount + 1) ) {
			result += "<li><a href='#'>&raquo;</a></li>";
		} else {			
			result += "<li><a href='" + url + "?pageNumber=" + (endPage + 1) + 
					"&pageSize=" + pageSize + "'>&raquo;</a></li>";
		}
		
		return result ;
	}
	
	private String getPagingHtml( String url, String order ){ 
		String result = "" ;
		if ( pageNumber <= pageCount ) {
			result += "<li><a href='#'>&laquo;</a></li>";			
		} else {
			result += "<li><a href='" + url + "?order=" + order + "&pageNumber=" + (beginPage - 1) + 
					"&pageSize=" + pageSize + "'>&laquo;</a></li>";
		}		
		
		for (int i = beginPage ; i <= endPage ; i++) {
			if(i == pageNumber){ 
				result += "<li class=\"active\"><a href='" + url + "?order=" + order + "&pageNumber=" + i + 
					"&pageSize=" + pageSize + "' >" + i + "</a></li>";
			}else{
				result += "<li><a href='" + url + "?order=" + order + "&pageNumber=" + i + 
					"&pageSize=" + pageSize + "' >" + i + "</a></li>";	
			}			
		}		
		if ( pageNumber >= (totalPage / pageCount * pageCount + 1) ) {
			result += "<li><a href='#'>&raquo;</a></li>";
		} else {			
			result += "<li><a href='" + url + "?order=" + order + "&pageNumber=" + (endPage + 1) + 
					"&pageSize=" + pageSize + "'>&raquo;</a></li>";
		}
		
		return result ;
	}
	
	private String getPagingHtml( String url, String type, String value ){ 
		String result = "" ;
		if ( pageNumber <= pageCount ) {
			result += "<li><a href='#'>&laquo;</a></li>";			
		} else {
			result += "<li><a href='" + url + "?pageNumber=" + (beginPage - 1) + 
					"&pageSize=" + pageSize + "&search_type=" + type + "&search_value=" + value + "'>&laquo;</a></li>";
		}		
		
		for (int i = beginPage ; i <= endPage ; i++) {
			if(i == pageNumber){ 
				result += "<li class=\"active\"><a href='" + url + "?pageNumber=" + i + 
					"&pageSize=" + pageSize + "&search_type=" + type + "&search_value=" + value + "' >" + i + "</a></li>";
			}else{
				result += "<li><a href='" + url + "?pageNumber=" + i + 
					"&pageSize=" + pageSize + "&search_type=" + type + "&search_value=" + value + "' >" + i + "</a></li>";	
			}			
		}		
		if ( pageNumber >= (totalPage / pageCount * pageCount + 1) ) {
			result += "<li><a href='#'>&raquo;</a></li>";
		} else {			
			result += "<li><a href='" + url + "?pageNumber=" + (endPage + 1) + 
					"&pageSize=" + pageSize + "&search_type=" + type + "&search_value=" + value + "'>&raquo;</a></li>";
		}
		
		return result ;
	}
	
	public String getPagingHtml() {	return pagingHtml;}
	public int getPageNumber() {	return pageNumber;}
	public int getPageSize() {	return pageSize;}	
	public String getPagingStatus() {	return pagingStatus;}	
	public int getBeginRow() {	return beginRow;}
	public int getEndRow() {	return endRow;}
	public int getTotalCount() {return totalCount;}
	
}
