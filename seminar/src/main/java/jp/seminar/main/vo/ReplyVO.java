package jp.seminar.main.vo;

public class ReplyVO {
	private int user_idx;
	private int reply_idx;
	private String reply_content;
	private String reply_write_date;
	private String reply_state;
	private int board_idx;
	private String f_type;
	private String user_name;
	
	
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReply_write_date() {
		return reply_write_date;
	}
	public void setReply_write_date(String reply_write_date) {
		this.reply_write_date = reply_write_date;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_state() {
		return reply_state;
	}
	public void setReply_state(String reply_state) {
		this.reply_state = reply_state;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getF_type() {
		return f_type;
	}
	public void setF_type(String f_type) {
		this.f_type = f_type;
	}
	@Override
	public String toString() {
		return "ReplyVO [user_idx=" + user_idx + ", reply_idx=" + reply_idx + ", reply_content=" + reply_content
				+ ", reply_write_date=" + reply_write_date + ", reply_state=" + reply_state + ", board_idx=" + board_idx
				+ ", f_type=" + f_type + ", user_name=" + user_name + "]";
	}
	
	
}
