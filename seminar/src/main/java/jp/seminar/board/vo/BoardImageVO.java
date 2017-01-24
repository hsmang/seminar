package jp.seminar.board.vo;

public class BoardImageVO {
	
	private String f_img_path;
	private String f_img_name;
	private int board_idx;
	private String f_type;
	
	public String getF_img_path() {
		return f_img_path;
	}
	public void setF_img_path(String f_img_path) {
		this.f_img_path = f_img_path;
	}
	public String getF_img_name() {
		return f_img_name;
	}
	public void setF_img_name(String f_img_name) {
		this.f_img_name = f_img_name;
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
	
}
