package jp.seminar.qna.service;

import java.util.List;

import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.qna.model.QnaVO;
import jp.seminar.user.model.UserVO;

public interface QnaService {
	List<QnaVO> getQnaList(FirstRowPageSize firstRowpageSize, String order);
	int qnaInsertProc(QnaVO qna);
	int qnaUpdateProc(QnaVO qna);
	int getTotalCount(String order);
	QnaVO getQnaDetail(int qna_idx);
}
