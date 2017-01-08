package jp.seminar.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.user.dao.BoardDAOImpl;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDao")
	private BoardDAOImpl boardDAO;
	
	@Override
	public List<Map<String, Object>> getBoardList(Map<String, Object> map) throws Exception{
		return boardDAO.selectList(map);
	}

	@Override
	public List<Map<String, Object>> getBoardDetail(Map<String, Object> map) throws Exception {
		return boardDAO.selectDetail(map);
	}
}
