package jp.seminar.qna.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.admin.dao.AdminDao;
import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.qna.dao.QnaDao;
import jp.seminar.qna.model.QnaVO;
import jp.seminar.user.model.UserVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Resource(name="qnaDao")
	private QnaDao qnaDao;

	@Override
	public int getTotalCount(String order) {
		return qnaDao.getTotalCount(order);
	}

	@Override
	public List<QnaVO> getQnaList(FirstRowPageSize firstRowpageSize, String order) {
		return qnaDao.getQnaList(firstRowpageSize, order);
	}

	@Override
	public int qnaInsertProc(QnaVO qna) {
		return qnaDao.qnaInsertProc(qna);
	}

	@Override
	public int qnaUpdateProc(QnaVO qna) {
		return qnaDao.qnaUpdateProc(qna);
	}

	@Override
	public QnaVO getQnaDetail(int qna_idx) {
		return qnaDao.getQnaDetail(qna_idx);
	}
}
