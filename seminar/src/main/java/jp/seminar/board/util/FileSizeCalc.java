package jp.seminar.board.util;

import java.io.File;
import java.text.DecimalFormat;

public class FileSizeCalc {

	public String sizeCalc(String path) {
		String[] gubun = { "bytes", "KB", "MB", "GB", "TB", "PB" };
		File file = new File(path);

		String refFormat = "0";
		Double size = (double) file.length();
		int idx = (int) Math.floor(Math.log(size) / Math.log(1024));
		DecimalFormat df = new DecimalFormat("#,###.##");
		double ref = ((size / Math.pow(1024, Math.floor(idx))));
		refFormat = df.format(ref) + "" + gubun[idx];
		
		return refFormat;
	}

}
