package jp.seminar.dataBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.StringUtils;

import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.FileVO;
import jp.seminar.board.vo.PhotoVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.dataBoard.service.DataBoardService;
import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.paging.Paging;
import jp.seminar.user.model.UserVO;
@Controller
public class TourController {
	///////////////////////////////////////////////////////////////////////////////
	@Resource(name = "tourService")
	private DataBoardService boardService;

	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/tour.do")
	public ModelAndView getTourBoardList(String pageNumber, String pageSize, String search_value,
			String search_type, HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws Exception {

		String url = request.getRequestURL().toString();

		if (search_value == null && search_type == null) {
			int totalCount = boardService.getTotalCount();
			Paging boardPaging = new Paging(pageNumber, pageSize, totalCount, url); // 페이징처리
			FirstRowPageSize firstRowpageSize = new FirstRowPageSize(); // db
																		// limit
			firstRowpageSize.setFirstRow(boardPaging.getBeginRow());
			firstRowpageSize.setPageSize(boardPaging.getPageSize());

			ModelAndView mv = new ModelAndView("/seminar/tour/tour");
			List<BoardVO> boardList = boardService.getBoardList(firstRowpageSize);
			for (BoardVO boardVO : boardList) {
				System.out.println(boardVO);
			}
			mv.addObject("boardList", boardList);
			mv.addObject("paging", boardPaging);

			return mv;

		} else {
			int totalCount = boardService.getSearchCount(search_type, search_value);
			Paging boardPaging = new Paging(pageNumber, pageSize, totalCount, url, search_type, search_value); // 페이징처리
			FirstRowPageSize firstRowpageSize = new FirstRowPageSize(); // db
																		// limit
			// 설정하기
			firstRowpageSize.setFirstRow(boardPaging.getBeginRow());
			firstRowpageSize.setPageSize(boardPaging.getPageSize());
			firstRowpageSize.setType(search_type);
			firstRowpageSize.setValue(search_value);

			ModelAndView mv = new ModelAndView("/seminar/tour/tour");
			List<BoardVO> boardList = boardService.getBoardSearchList(firstRowpageSize);

			mv.addObject("boardList", boardList);
			mv.addObject("paging", boardPaging);

			return mv;
		}
	}

	///////////////////////////////////////////////////////////////////////////////
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	@RequestMapping(value = "/tour/detail.do", method = RequestMethod.GET)
	public ModelAndView getTourBoardDetail(int board_idx, String f_type, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("/seminar/tour/tour_detail");

		Cookie cookies[] = request.getCookies();
		Map mapCookie = new HashMap();
		if (request.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				mapCookie.put(obj.getName(), obj.getValue());
			}
		}

		UserVO user = (UserVO) session.getAttribute("user");

		BoardVO detail = new BoardVO();
		detail = boardService.getBoardDetail(board_idx);
		mv.addObject("detail", detail);
		mv.addObject("board_user_idx", detail.getUser_idx());

		Board_UserVO uservo = boardService.getCertainUser(detail.getUser_idx());
		mv.addObject("user", uservo);

		ReplyVO reply = new ReplyVO();
		reply.setBoard_idx(board_idx);
		reply.setF_type(f_type);
		List<ReplyVO> replyList = boardService.getReply(reply);
		for (ReplyVO replyVO : replyList) {
			System.out.println(replyVO);
		}
		System.out.println(replyList);
		mv.addObject("replyList", replyList);

		FileVO file = new FileVO();
		file.setBoard_idx(board_idx);
		file.setF_type("TO");
		List<FileVO> fileList = boardService.getFileList(file);
		mv.addObject("fileList", fileList);

		String cookie_read_count = (String) mapCookie.get("read_count");
		String new_cookie_read_count = "|" + board_idx;

		if (StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1) {
			Cookie cookie = new Cookie("read_count", cookie_read_count + new_cookie_read_count);
			response.addCookie(cookie);
			boardService.updateBoardCount(board_idx);
		}

		return mv;
	}

	@RequestMapping(value = "/tour/fileDownload.do")
	public ModelAndView fileDownload_Tour(@RequestParam("filePath") String filePath) throws Exception {
		String path = filePath;
		File downloadFile = new File(path);
		return new ModelAndView("fileDownloadView", "downloadFile", downloadFile);
	}

	@RequestMapping(value = "/tour/insertReply.do")
	public String insertTourReply(HttpSession session, ReplyVO reply, HttpServletRequest request, int board_idx, String f_type)
			throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		reply.setBoard_idx(board_idx);
		reply.setF_type(f_type);
		reply.setUser_idx(user.getUser_idx());
		// reply.setReply_content((String)request.getParameter("reply_content"));
		// ReplyVO 안에 추가되어있어서 이부분 삭제

		boardService.insertReply(reply);

		return "redirect:/tour/detail.do?board_idx=" + board_idx + "&f_type=" + f_type;
	}
	
	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/tour/deleteReplyProc.do")
	public String deleteTourReply(HttpServletRequest request, int reply_idx) throws Exception {
		boardService.deleteReply(reply_idx);
		String referer_url = request.getHeader("REFERER");
		return "redirect:" + referer_url;
	}
	
	

	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/tour/update.do", method = RequestMethod.GET)
	public ModelAndView updateTourBoardDetail(int board_idx) throws Exception {
		ModelAndView mv = new ModelAndView("/seminar/tour/tour_update");

		BoardVO board = boardService.getBoardDetail(board_idx);
		mv.addObject("board", board);
		mv.addObject("board_user_idx", board.getUser_idx());
		FileVO file = new FileVO();
		file.setBoard_idx(board_idx);
		file.setF_type("TO");
		List<FileVO> fileList = boardService.getFileList(file);
		mv.addObject("fileList", fileList);

		return mv;
	}

	///////////////////////////////////////////////////////////////////////////////
	/*
	 * boardVO 매개변수로 다 받음
	 */
	@RequestMapping(value = "/tour/updateProc.do")
	public String updateProcTourBoardDetail(BoardVO board, HttpServletRequest request) throws Exception {
		Document doc = Jsoup.parse(board.getBoard_content());
		try {
			Element img = doc.select("img").first();
			board.setMain_img(img.attr("src"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		boardService.updateBoardDetail(board);

		return "redirect:/tour.do";
	}

	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/tour/deleteProc.do")
	public String deleteTourBoardDetail(int board_idx) throws Exception {
		boardService.deleteBoardDetail(board_idx);

		return "redirect:/tour.do";
	}

	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/tour/insert.do")
	public String insertTourBoard() throws Exception {

		return "/seminar/tour/tour_insert";
	}

	///////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/tour/insertProc.do")
	public String insertProcTourBoard(BoardVO board, HttpServletRequest request, HttpSession session)
			throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		board.setUser_idx(user.getUser_idx());
		Document doc = Jsoup.parse(board.getBoard_content());
		try {
			Element img = doc.select("img").first();
			board.setMain_img(img.attr("src"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		boardService.insertBoard(board);
		return "redirect:/tour.do";
	}

	///////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/tour/fileUpload.do")
	@ResponseBody
	public Map<String, String> fileUpload_Tour(HttpServletRequest request, FileVO filevo, String board_idx)
			throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		try {
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			String filePath = dftFilePath + "resources/file_upload/";
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			String originalFileName = null;

			while (iterator.hasNext()) {
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				if (multipartFile.isEmpty() == false) {
					SimpleDateFormat year = new SimpleDateFormat("yyyy");
					SimpleDateFormat month = new SimpleDateFormat("MM");
					SimpleDateFormat day = new SimpleDateFormat("dd");
					String year_format = year.format(new java.util.Date());
					String month_format = month.format(new java.util.Date());
					String day_format = day.format(new java.util.Date());
					Random rand = new Random();
					int r = rand.nextInt(99999);
					filePath = filePath + year_format + "/" + month_format + "/" + day_format + "/" + r + "/";

					File file = new File(filePath);
					if (file.exists() == false) {
						file.mkdirs();
					}

					originalFileName = multipartFile.getOriginalFilename();

					file = new File(filePath + originalFileName);
					System.out.println(file.getAbsolutePath());
					multipartFile.transferTo(file);

					FileVO fileinfo = new FileVO();
					fileinfo.setF_attach_path(filePath);
					fileinfo.setF_attach_name(originalFileName);
					fileinfo.setF_type("TO");
					if (board_idx == null)
						boardService.insertFile(fileinfo);
					else
						boardService.insertFile(fileinfo, board_idx);
					resultMap.put("filePath", file.getAbsolutePath());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		resultMap.put("result", "success");
		return resultMap;
	}

	@RequestMapping(value = "/tour/fileDelete.do")
	@ResponseBody
	public Map<String, String> fileDelete_Tour(String name, int index) throws Exception {
		FileVO fileinfo = new FileVO();
		fileinfo.setBoard_idx(index);
		fileinfo.setF_attach_name(name);

		boardService.deleteFileinfo(fileinfo);

		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", "success");
		return resultMap;
	}

	/////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/tour/photoUpload.do")
	public String singlePhotoUpload_Tour(HttpServletRequest request, HttpServletResponse response, PhotoVO editor) {
		String return1 = request.getParameter("callback");
		String return2 = "?callback_func=" + request.getParameter("callback_func");
		String return3 = "";
		String name = "";

		try {
			if (editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null
					&& !editor.getFiledata().getOriginalFilename().equals("")) {
				// 기존 상단 코드를 막고 하단코드를 이용
				name = editor.getFiledata().getOriginalFilename()
						.substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator) + 1);
				String filename_ext = name.substring(name.lastIndexOf(".") + 1);
				filename_ext = filename_ext.toLowerCase();
				String[] allow_file = { "jpg", "png", "bmp", "gif" };
				int cnt = 0;

				for (int i = 0; i < allow_file.length; i++) {
					if (filename_ext.equals(allow_file[i])) {
						cnt++;
					}
				}
				if (cnt == 0) {
					return3 = "&errstr=" + name;
				} else {
					// 파일 기본경로
					String dftFilePath = request.getSession().getServletContext().getRealPath("/");
					// 파일 기본경로 _ 상세경로
					String filePath = dftFilePath + "resources/photo_upload/";
					File file = new File(filePath);
					if (!file.exists()) {
						file.mkdirs();
					}

					String realFileNm = "";
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					realFileNm = today + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					BoardImageVO image = new BoardImageVO();
					image.setF_img_name(request.getHeader("file-name"));
					image.setF_img_path(rlFileNm);
					image.setF_type("TO");
					boardService.insertBoardImage(image);

					editor.getFiledata().transferTo(new File(rlFileNm));
					///////////////// 서버에 파일쓰기 /////////////////
					return3 += "&bNewLine=true";
					return3 += "&sFileName=" + name;
					return3 += "&sFileURL=/resources/photo_upload/" + realFileNm;
				}
			} else {
				return3 += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + return1 + return2 + return3;
	}

	///////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/tour/multiplePhotoUpload.do")
	public void multiplePhotoUpload_Tour(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "resources/photo_upload/";
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;

			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();

			///////////////// 디비에 정보 저장하기 /////////////////
			BoardImageVO image = new BoardImageVO();
			image.setF_img_name(filename);
			image.setF_img_path(rlFileNm);
			image.setF_type("TO");
			boardService.insertBoardImage(image);

			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			;
			sFileInfo += "&sFileURL=" + "/resources/photo_upload/" + realFileNm;
			System.out.println(sFileInfo);
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
