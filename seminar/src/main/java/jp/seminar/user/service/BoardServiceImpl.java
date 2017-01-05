package jp.seminar.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import jp.seminar.user.dao.BoardDaoImpl;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDao")
	private BoardDaoImpl boardDao;
	
	@Override
	public List<Map<String, Object>> getBoardList(Map<String, Object> map) throws Exception{
		
		log.debug("@@@@@@@@@@@@@@@@@@@@@@@ boardServiceImpl");
		
		return boardDao.selectList(map);
	}
}
