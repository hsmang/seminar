package jp.seminar.board.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jp.seminar.board.dao.BasicSeminarDAOImpl;
import jp.seminar.board.dao.BussinessAdminDAOImpl;
import jp.seminar.board.util.FileSizeCalc;
import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.FileVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.FirstRowPageSize;

@Service("businessAdminService")
public class BusinessAdminServiceImpl implements BoardService {
	
	@Resource(name="businessAdminDao")
	private BussinessAdminDAOImpl boardDAO;
	
	@Override
	public List<Board_UserVO> getUserList() throws Exception {
		return boardDAO.selectUserList();
	}
	
	@Override
	public List<BoardVO> getBoardList(FirstRowPageSize  firstRowpageSize) throws Exception{
		List<BoardVO> boardList = boardDAO.selectList(firstRowpageSize);
		List<Board_UserVO> userList = boardDAO.selectUserList();
		
		for(int i=0; i<boardList.size(); i++){
			for(int j=0; j<userList.size(); j++){
				BoardVO board = new BoardVO();
				if( boardList.get(i).getUser_idx() == userList.get(j).getUser_idx()){
					board.setBoard_idx(boardList.get(i).getBoard_idx());
					board.setBoard_content(boardList.get(i).getBoard_content());
					board.setBoard_count(boardList.get(i).getBoard_count());
					board.setBoard_reg_date(boardList.get(i).getBoard_reg_date());
					board.setBoard_subject(boardList.get(i).getBoard_subject());
					board.setBoard_update_date(boardList.get(i).getBoard_update_date());
					board.setUser_name(userList.get(j).getUser_name());
					boardList.set(i, board);
				}
			}
		}
		return boardList;
	}

	@Override
	public List<BoardVO> getBoardSearchList(FirstRowPageSize  firstRowpageSize) {
		List<BoardVO> boardList = boardDAO.selectSearchList(firstRowpageSize);
		List<Board_UserVO> userList = boardDAO.selectUserList();
		
		for(int i=0; i<boardList.size(); i++){
			for(int j=0; j<userList.size(); j++){
				BoardVO board = new BoardVO();
				if( boardList.get(i).getUser_idx() == userList.get(j).getUser_idx()){
					board.setBoard_idx(boardList.get(i).getBoard_idx());
					board.setBoard_content(boardList.get(i).getBoard_content());
					board.setBoard_count(boardList.get(i).getBoard_count());
					board.setBoard_reg_date(boardList.get(i).getBoard_reg_date());
					board.setBoard_subject(boardList.get(i).getBoard_subject());
					board.setBoard_update_date(boardList.get(i).getBoard_update_date());
					board.setUser_name(userList.get(j).getUser_name());
					boardList.set(i, board);
				}
			}
		}
		return boardList;
	}

	@Override
	public BoardVO getBoardDetail(int board_idx) throws Exception {
		BoardVO detail = boardDAO.selectDeatil(board_idx);
		return detail;
	}

	@Override
	public int insertBoard(BoardVO board) throws Exception {
		return boardDAO.insertDetail(board);
	}

	@Override
	public int updateBoardDetail(BoardVO board) throws Exception {
		return boardDAO.updateDetail(board);
	}

	@Override
	public int deleteBoardDetail(int board_idx) throws Exception {
		return boardDAO.deleteDetail(board_idx);
	}

	@Override
	public int insertReply(ReplyVO reply) throws Exception {
		return boardDAO.insertReply(reply);
	}

	@Override
	public int updateBoardCount(int board_idx) throws Exception {
		return boardDAO.updateBoardCount(board_idx);
	}

	@Override
	public int insertBoardImage(BoardImageVO image) throws Exception {
		return boardDAO.insertBoardImage(image);
	}

	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public int getSearchCount(String search_type, String search_value) {
		Map searchMap = new HashMap();
		searchMap.put("type", search_type);
		searchMap.put("value", search_value);
		return boardDAO.getSearchCount(searchMap);
	}
	
	@Override
	public Board_UserVO getCertainUser(int user_idx) {
		return boardDAO.getCertainUser(user_idx);
	}

	@Override
	public List<ReplyVO> getReply(ReplyVO reply) {
		List<ReplyVO> replyList = boardDAO.getReply(reply);
		List<Board_UserVO> userList = boardDAO.selectUserList();
		
		for(int i=0; i<replyList.size(); i++){
			for(int j=0; j<userList.size(); j++){
				ReplyVO replyOne = new ReplyVO();
				if( replyList.get(i).getUser_idx() == userList.get(j).getUser_idx()){
					replyOne.setBoard_idx(replyList.get(i).getBoard_idx());
					replyOne.setF_type(replyList.get(i).getF_type());
					replyOne.setReply_content(replyList.get(i).getReply_content());
					replyOne.setReply_state(replyList.get(i).getReply_state());
					replyOne.setReply_write_date(replyList.get(i).getReply_write_date());
					replyOne.setUser_name(userList.get(j).getUser_name());
					replyList.set(i, replyOne);
				}
			}
		}
		return replyList;
	}

	@Override
	public int insertFile(FileVO fileinfo) {
		int	maxIdx = 0;
		maxIdx = boardDAO.getMaxBoard_idx();
		if(maxIdx == 0){
			maxIdx = 1;
		}
		fileinfo.setBoard_idx(++maxIdx);
		return boardDAO.insertFileinfo(fileinfo);
	}
	
	@Override
	public int insertFile(FileVO fileinfo, String board_idx) {
		fileinfo.setBoard_idx(Integer.parseInt(board_idx));
		return boardDAO.insertFileinfo(fileinfo);
	}

	@Override
	public List<FileVO> getFileList(FileVO fileinfo) {
		List<FileVO> fileList = boardDAO.getFileList(fileinfo);
		FileSizeCalc calc = new FileSizeCalc();
		int index = 0;
		for (FileVO fileVO : fileList) {
			FileVO fileOne = new FileVO();
			fileOne.setF_attach_idx(fileVO.getF_attach_idx());
			fileOne.setF_attach_name(fileVO.getF_attach_name());
			fileOne.setF_attach_path(fileVO.getF_attach_path());
			File file = new File(fileVO.getF_attach_path()+fileVO.getF_attach_name());
			fileOne.setOriginal_fileSize(Long.toString(file.length()));
			fileOne.setFileSize(calc.sizeCalc(fileVO.getF_attach_path()+fileVO.getF_attach_name()));
			fileList.set((index++), fileOne);
		}
		return fileList;
	}

	@Override
	public int deleteFileinfo(FileVO fileinfo) {
		return boardDAO.deleteFileinfo(fileinfo);
	}



}



