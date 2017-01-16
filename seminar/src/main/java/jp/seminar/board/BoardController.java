package jp.seminar.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jp.seminar.user.service.BoardService;
import twitter4j.Twitter;
import twitter4j.auth.AccessToken;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	private static final String ACCESS_TOKEN = "808906216009244672-wU7ZJRmLKZrPS496vuRKJGbRNSD6Iwf";
	private static final String ACCESS_TOKEN_SECRET = "fwrtC4KH1oEC6pZYh9Kf2JBkiigMwLqcW00zp9x4TCdaO";
	private static final String CONSUMER_KEY = "nxN88I51NyTK3a6ubpmMsg51U";
	private static final String CONSUMER_SECRET = "dxlsnQleP0StDnhCT2EeXyj7kCe2SedafRFjgLnmI2kAfmSjJf";
	private AccessToken assessToken = new AccessToken(ACCESS_TOKEN, ACCESS_TOKEN_SECRET);
///////////////////////////////////////////////////////////////////////////////
	@Resource(name="boardService")
	private BoardService boardService;
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar.do")
	public ModelAndView getBasicSeminarBoardList() throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar/basicSeminar");
		List<Map<String, Object>> boardList = boardService.getBoardList();
		mv.addObject("boardList", boardList);
		
		List<Map<String, Object>> userList = boardService.getUserList();
		mv.addObject("userList", userList);
		System.out.println(userList);

		/*Twitter twitter = TwitterFactory.getSingleton();
		twitter = twitInit(twitter);
		
		Paging page = new Paging(1, 1);
		List<Map> twitList = new ArrayList<Map>();
		
		try{
			List<Status> status = twitter.getHomeTimeline(page);
			for(Status statuses : status){
				twitList.add(insertTwitToMap(statuses.getUser().getScreenName(), statuses.getText()));
			}
			mv.addObject("twitList", twitList);
		}catch(Exception e){
			e.printStackTrace();
		}*/
		return mv;
	}
	
	private Map<String, Object> insertTwitToMap(String writter, String content){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writter);
		map.put("content", content);
		return map;
	}
	
	private Twitter twitInit(Twitter twitter){
		if(twitter.getAuthorization().toString().equals("NullAuthentication{SINGLETON}")){
			twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);
			twitter.setOAuthAccessToken(assessToken);
		}
		return twitter;
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/detail.do", method=RequestMethod.GET)
	public ModelAndView getBasicSeminarBoardDetail(int board_idx, String f_type) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar/basicSeminar_detail");
		List<Map<String, Object>> list = boardService.getBoardDetail(board_idx);
		mv.addObject("list", list);
		
		ReplyVO reply = new ReplyVO();
		reply.setBoard_idx(board_idx);
		reply.setF_type(f_type);
		List<Map<String, Object>> replyList = boardService.getReply(reply);
		mv.addObject("replyList", replyList);
		
		return mv;
	}
	
	@RequestMapping(value = "/seminar/insertReply.do")
	public String insertBasicSeminarReply(HttpServletRequest request, int board_idx) throws Exception{
		
		ReplyVO reply = new ReplyVO();
		reply.setBoard_idx(board_idx);
		reply.setF_type((String)request.getParameter("f_type"));
		reply.setReply_content((String)request.getParameter("reply_content"));
		boardService.insertReply(reply);
		
		return "redirect:/seminar/detail.do?board_idx="+board_idx+"&f_type="+reply.getF_type();
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/update.do", method=RequestMethod.GET)
	public ModelAndView updateBasicSeminarBoardDetail(int board_idx) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar/basicSeminar_update");
		List<Map<String, Object>> list = boardService.getBoardDetail(board_idx);
		mv.addObject("list", list);
				
		return mv;
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/updateProc.do")
		public String updateProcBasicSeminarBoardDetail(HttpServletRequest request) throws Exception{
		
		BoardVO board = new BoardVO();
		board.setSubject((String)request.getParameter("subject"));
		board.setContent((String)request.getParameter("content"));
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
	public String insertBsicSeminarBoard() throws Exception{
		
		return "/board/basicSeminar/basicSeminar_insert";
	}
	
///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/seminar/insertProc.do")
	public String insertProcBasicSeminarBoard(HttpServletRequest request) throws Exception{
		BoardVO board = new BoardVO();
		
		board.setSubject((String)request.getParameter("subject"));
		board.setContent((String)request.getParameter("content"));
		board.setUser_idx(Integer.parseInt(request.getParameter("user_idx")));
		
		boardService.insertBoard(board);
		
		return "redirect:/seminar.do";
	}
	
/////////////////////////////////////////////////////////////////////////////
/*	@RequestMapping(value = "/board/upload.do", method=RequestMethod.POST)
	@ResponseBody
	public ResultResponse<Object> uploadFile(MultipartHttpServletRequest request,@RequestParam String orderCode,@RequestParam int fileType,@RequestParam String assignedAe) {
	    ResultResponse resultResponse = new ResultResponse();
	    boolean success;
	    try {
	        Iterator<String> itr = request.getFileNames();
	        while (itr.hasNext()) {
	            String uploadedFile = itr.next();
	            MultipartFile file = request.getFile(uploadedFile);
	            success = fileService.saveFile(file,orderCode,fileType,assignedAe);
	            resultResponse.setIsok(success);
	        }
	        resultResponse.setMessage("文件上传成功！");
	    }catch (IOException e) {
	        resultResponse.setIsok(false);
	        resultResponse.setMessage("文件上传失败！");
	        e.printStackTrace();
	    }
	    return resultResponse;
	}
*/
	
/////////////////////////////////////////////////////////////////////////////
	/*@RequestMapping("/board/photoUpload.do") 
	public String photoUpload(HttpServletRequest request, PhotoVO vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;             
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 /////////////////
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}*/
	
	@RequestMapping("/board/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
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
			String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
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
			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			;
			sFileInfo += "&sFileURL=" + "/resource/photo_upload/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}

