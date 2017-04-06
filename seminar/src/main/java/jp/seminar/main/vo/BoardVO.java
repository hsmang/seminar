package jp.seminar.main.vo;

public class BoardVO {
	private String board_subject;
	private String board_content;
	private String board_reg_date;
	private String board_update_date;
	private String user_name;
	private int user_idx;
	private int board_idx;
	private int board_count;
	private String main_img;
	
	
	
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(String board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public String getBoard_update_date() {
		return board_update_date;
	}
	public void setBoard_update_date(String board_update_date) {
		this.board_update_date = board_update_date;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	@Override
	public String toString() {
		return "BoardVO [board_subject=" + board_subject + ", board_content=" + board_content + ", board_reg_date="
				+ board_reg_date + ", board_update_date=" + board_update_date + ", user_name=" + user_name
				+ ", user_idx=" + user_idx + ", board_idx=" + board_idx + ", board_count=" + board_count + ", main_img="
				+ main_img + "]";
	}
	
	
	
}
