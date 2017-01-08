package jp.seminar.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository("boardDao")
public class BoardDAOImpl extends BoardDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("board.selectList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDetail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectDeatil("board.selectDetail", map);
	}
}
