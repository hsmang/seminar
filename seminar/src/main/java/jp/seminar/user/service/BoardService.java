package jp.seminar.user.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	List<Map<String, Object>> getBoardList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getBoardDetail(Map<String, Object> map) throws Exception;
	
}
