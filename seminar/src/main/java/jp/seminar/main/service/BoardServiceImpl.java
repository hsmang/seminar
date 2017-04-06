package jp.seminar.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.board.vo.BoardVO;
import jp.seminar.main.dao.BoardDAOImpl;
import jp.seminar.paging.FirstRowPageSize;

@Service("mainService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="mainDao")
	private BoardDAOImpl boardDAO;

	@Override
	public List selectList(FirstRowPageSize firstRowpageSize) {
		return boardDAO.selectList(firstRowpageSize);
	}
}



