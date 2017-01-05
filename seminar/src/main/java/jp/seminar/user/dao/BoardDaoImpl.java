package jp.seminar.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDaoImpl extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("board.selectList", map);
	}
}
