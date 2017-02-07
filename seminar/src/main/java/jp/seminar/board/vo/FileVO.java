package jp.seminar.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {

	private MultipartFile file;
	private String f_attach_path;
	private String f_attach_name;
	private int board_idx;
	private String f_type;
	private int f_attach_idx;
	private String fileSize;
	private String original_fileSize;
	
	
	public String getOriginal_fileSize() {
		return original_fileSize;
	}
	public void setOriginal_fileSize(String original_fileSize) {
		this.original_fileSize = original_fileSize;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public int getF_attach_idx() {
		return f_attach_idx;
	}
	public void setF_attach_idx(int f_attach_idx) {
		this.f_attach_idx = f_attach_idx;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getF_attach_path() {
		return f_attach_path;
	}
	public void setF_attach_path(String f_attach_path) {
		this.f_attach_path = f_attach_path;
	}
	public String getF_attach_name() {
		return f_attach_name;
	}
	public void setF_attach_name(String f_attach_name) {
		this.f_attach_name = f_attach_name;
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
