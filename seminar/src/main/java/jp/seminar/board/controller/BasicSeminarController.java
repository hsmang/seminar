package jp.seminar.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jp.seminar.board.service.BoardService;
import jp.seminar.board.vo.BoardImageVO;
import jp.seminar.board.vo.BoardVO;
import jp.seminar.board.vo.Board_UserVO;
import jp.seminar.board.vo.PhotoVO;
import jp.seminar.board.vo.ReplyVO;
import jp.seminar.paging.BoardPaging;
import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.user.model.UserVO;

@Controller
public class BasicSeminarController {
	Logger log = Logger.getLogger(this.getClass());
	
///////////////////////////////////////////////////////////////////////////////
	@Resource(name="boardService")
	private BoardService boardService;
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar.do")
	public ModelAndView getBasicSeminarBoardList(String pageNumber, String pageSize,HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		String url = request.getRequestURL().toString();
		int totalCount = boardService.getTotalCount(); 
		BoardPaging boardPaging = new BoardPaging(pageNumber, pageSize , totalCount, url); // 페이징처리
		FirstRowPageSize  firstRowpageSize = new FirstRowPageSize(); // db limit 설정하기
		firstRowpageSize.setFirstRow(boardPaging.getBeginRow());
		firstRowpageSize.setPageSize(boardPaging.getPageSize());
		
		ModelAndView mv = new ModelAndView("/board/basicSeminar/basicSeminar");
		List<BoardVO> boardList = boardService.getBoardList(firstRowpageSize);
		
		mv.addObject("boardList", boardList);
		mv.addObject("paging", boardPaging);
		
		return mv;
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/detail.do", method=RequestMethod.GET)
	public ModelAndView getBasicSeminarBoardDetail(int board_idx, String f_type, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar/basicSeminar_detail");

		UserVO user = (UserVO) session.getAttribute("user");
		
		BoardVO detail = new BoardVO();
		detail = boardService.getBoardDetail(board_idx);
		mv.addObject("detail", detail);
		
		Board_UserVO uservo = boardService.getCertainUser(detail.getUser_idx());
		mv.addObject("user", uservo);
		
		ReplyVO reply = new ReplyVO();
		reply.setBoard_idx(board_idx);
		reply.setF_type(f_type);
		List<ReplyVO> replyList = boardService.getReply(reply);
		mv.addObject("replyList", replyList);
		
		return mv;
	}
	
	@RequestMapping(value = "/seminar/insertReply.do")
	public String insertBasicSeminarReply(HttpServletRequest request, int board_idx, String f_type) throws Exception{
		ReplyVO reply = new ReplyVO();
		reply.setBoard_idx(board_idx);
		reply.setF_type(f_type);
		reply.setReply_content((String)request.getParameter("reply_content"));
		boardService.insertReply(reply);
		
		return "redirect:/seminar/detail.do?board_idx="+board_idx+"&f_type="+f_type;
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/update.do", method=RequestMethod.GET)
	public ModelAndView updateBasicSeminarBoardDetail(int board_idx) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar/basicSeminar_update");
		
		/*List<Map<String, Object>> list = boardService.getBoardDetail(board_idx);
		mv.addObject("list", list);*/
				
		return mv;
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/updateProc.do")
		public String updateProcBasicSeminarBoardDetail(HttpServletRequest request) throws Exception{
		
		BoardVO board = new BoardVO();
		board.setBoard_subject((String)request.getParameter("subject"));
		board.setBoard_content((String)request.getParameter("content"));
		board.setBoard_idx(Integer.parseInt(request.getParameter("board_idx")));
		
		boardService.updateBoardDetail(board);
		
		return "redirect:/seminar.do";
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/deleteProc.do")
	public String deleteBasicSeminarBoardDetail(int board_idx) throws Exception{
		boardService.deleteBoardDetail(board_idx);

		return "redirect:/seminar.do";
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/insert.do")
	public String insertBasicSeminarBoard() throws Exception{
		
		return "/board/basicSeminar/basicSeminar_insert";
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/seminar/insertProc.do")
	public String insertProcBasicSeminarBoard(HttpServletRequest request, HttpSession session) throws Exception{
		UserVO user = (UserVO) session.getAttribute("user");
		BoardVO board = new BoardVO();
		board.setBoard_subject((String)request.getParameter("subject"));
		board.setBoard_content((String)request.getParameter("content"));
		board.setUser_idx(user.getUser_idx());
		boardService.insertBoard(board);
		
		return "redirect:/seminar.do";
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/seminar/fileUpload.do")
	public void fileUpload_jquery_fileUpload(HttpServletRequest request) throws Exception  {
		String filePath = "C:/Users/wjg/git/seminar/seminar/src/main/resources/files/";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		@SuppressWarnings("unused")
		String originalFileExtension = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				file = new File(filePath + originalFileName);
				multipartFile.transferTo(file);
			}
		}
		
	}
	
	@RequestMapping(value="/seminar/fileUpload_dropzone.do")
	public String fileUpload_jquery_fileUpload_dropzone(HttpServletRequest request)  {
		
		return null;
	}
	
	/////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/seminar/photoUpload.do") 
	public String singlePhotoUpload(HttpServletRequest request, HttpServletResponse response, PhotoVO editor){ 
		String return1=request.getParameter("callback"); 
		System.out.println("return 1 : " + return1);
		String return2="?callback_func=" + request.getParameter("callback_func");
		System.out.println("return 2 : " + return2);
		String return3=""; 
		String name = ""; 
		
		try { 
			if(editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null && !editor.getFiledata().getOriginalFilename().equals("")) { 
				// 기존 상단 코드를 막고 하단코드를 이용 
				name = editor.getFiledata().getOriginalFilename().substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator)+1); 
				String filename_ext = name.substring(name.lastIndexOf(".")+1); 
				filename_ext = filename_ext.toLowerCase(); 
				String[] allow_file = {"jpg","png","bmp","gif"}; 
				int cnt = 0; 
				
				for(int i=0; i<allow_file.length; i++) { 
					if(filename_ext.equals(allow_file[i])){ 
						cnt++; 
					} 
				} 
				if(cnt == 0) { 
					return3 = "&errstr="+name; 
				} else { 
					//파일 기본경로 
					String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
					//파일 기본경로 _ 상세경로
					String filePath = dftFilePath + "resources"+ File.separator + "editor" + File.separator +"upload" + File.separator; 
					File file = new File(filePath); 
					
					if(!file.exists()) { 
						file.mkdirs(); 
					} 
					
					String realFileNm = ""; 
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd"); 
					String today= formatter.format(new java.util.Date()); 
					realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm; 
					///////////////// 서버에 파일쓰기 ///////////////// 
					editor.getFiledata().transferTo(new File(rlFileNm)); 
					///////////////// 서버에 파일쓰기 ///////////////// 
					return3 += "&bNewLine=true"; 
					return3 += "&sFileName="+ name; 
					return3 += "&sFileURL=/resources/editor/upload/"+realFileNm; 
					} 
				}
			else { 
				return3 += "&errstr=error"; 
			} 
		}catch (Exception e) { 
			e.printStackTrace();
		} 
		System.out.println("return : " + return1+return2+return3);
		return "redirect:"+return1+return2+return3; 
	}
	

	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/seminar/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	        	 os.write(b,0,numRead);
	         }
	         if(is != null) {
	        	 is.close();
	         }
	         os.flush();
	         os.close();
	         
			 ///////////////// 디비에 정보 저장하기 /////////////////
			 BoardImageVO image = new BoardImageVO();
			 image.setF_img_name(filename);
			 image.setF_img_path(rlFileNm);
			 image.setF_type("SE");
			 boardService.insertBoardImage(image);
	         
			 ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resource/photo_upload/"+realFileNm;
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

