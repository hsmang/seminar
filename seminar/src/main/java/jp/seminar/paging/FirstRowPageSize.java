package jp.seminar.paging;

public class FirstRowPageSize {
	private int firstRow;
	private int pageSize;
	private String value;
	private String type;
	
	
	public FirstRowPageSize() {	}
	public FirstRowPageSize(int firstRow, int pageSize) {
		this.firstRow = firstRow;
		this.pageSize = pageSize;
	}
	
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
