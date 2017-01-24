package jp.seminar.board.vo;

public class BoardVO {
	private String subject;
	private String content;
	private int user_idx;
	private int board_idx;
	private int board_count;
	
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	
	
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public int getUser_idx() {
		return user_idx;
	}
	
}
