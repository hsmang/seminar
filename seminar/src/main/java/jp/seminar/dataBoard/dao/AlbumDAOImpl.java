package jp.seminar.dataBoard.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.FileVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

@Repository("albumDao")
public class AlbumDAOImpl implements DataBoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> selectList(FirstRowPageSize  firstRowpageSize) {
		return sqlSession.selectList("album.selectList" , firstRowpageSize);
	}

	@Override
	public BoardVO selectDeatil(int board_idx) {
		return (BoardVO) sqlSession.selectOne("album.selectDetail", board_idx);
	}

	@Override
	public int insertDetail(BoardVO board) {
		return sqlSession.insert("album.insertDetail", board);
	}

	@Override
	public int updateDetail(BoardVO board) {
		return sqlSession.update("album.updateDetail", board);
	}

	@Override
	public int deleteDetail(int board_idx) {
		return sqlSession.delete("album.deleteDetail", board_idx);
	}

	@Override
	public List<Board_UserVO> selectUserList() {
		return sqlSession.selectList("album.selectUserList");
	}

	@Override
	public int insertReply(ReplyVO reply) {
		return sqlSession.insert("reply.insertReply", reply);
	}
	
	@Override
	public int updateBoardCount(int board_idx) {
		return sqlSession.insert("album.updateBoardCount", board_idx);
	}

	@Override
	public int insertBoardImage(BoardImageVO image) {
		return sqlSession.insert("boardImage.insertBoardImage", image);
	}

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("album.getTotalCount");
	}
	
	@Override
	public int getSearchCount(Map searchMap) {
		return sqlSession.selectOne("album.getSearchCount", searchMap);
	}

	@Override
	public Board_UserVO getCertainUser(int user_idx) {
		return sqlSession.selectOne("album.selectCertainUser", user_idx);
	}

	@Override
	public List<ReplyVO> getReply(ReplyVO reply) {
		return sqlSession.selectList("reply.selectReply", reply);
	}

	@Override
	public int insertFileinfo(FileVO fileinfo) {
		return sqlSession.insert("file.insertFileinfo", fileinfo);
	}

	@Override
	public int getMaxBoard_idx() {
		return sqlSession.selectOne("album.getMaxIdx");
	}

	@Override
	public List<FileVO> getFileList(FileVO file) {
		return sqlSession.selectList("file.selectFileList", file);
	}

	@Override
	public int deleteFileinfo(FileVO fileinfo) {
		return sqlSession.delete("file.deleteFileinfo", fileinfo);
	}

	@Override
	public List<BoardVO> selectSearchList(FirstRowPageSize  firstRowpageSize) {
		return sqlSession.selectList("album.selectSearchList", firstRowpageSize);
	}

	@Override
	public int deleteReply(int reply_idx) {
		return sqlSession.delete("reply.deleteReply", reply_idx);
	}
}
