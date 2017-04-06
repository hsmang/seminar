package jp.seminar.qna.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jp.seminar.dataBoard.service.DataBoardService;
import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.paging.Paging;
import jp.seminar.qna.model.QnaVO;
import jp.seminar.qna.service.QnaService;
import jp.seminar.user.model.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QnAController {
	
	@Autowired 
	private JavaMailSender mailSender;
	
	@Resource(name = "qnaService")
	private QnaService qnaService;
	
	private String from 	= "金泰旭ゼミナール";
	private String subject	= "ご連絡、ありがとうございます。";
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	
	@RequestMapping(value = "/qna.do", method = RequestMethod.GET)
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/qna");
		return mav ;
	}
	
	@RequestMapping(value = "/qna/insert.do", method = RequestMethod.POST)
	public ModelAndView qnaInsert(QnaVO qna) {
		qnaService.qnaInsertProc(qna);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav ;
	}
	
	@RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
	public ModelAndView qnaUpdate(QnaVO qna,HttpServletRequest request, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		if(user == null){
			mav.setViewName("redirect:/index.do");
			return mav;
		}else{
			if(user.getUser_role() != 0){
				mav.setViewName("redirect:/index.do");
				return mav;
			}
		}
		qnaService.qnaUpdateProc(qna);
		sendMail(qna.getUser_email(), qna.getQna_content());
		mav.setViewName("redirect:/qna/qnaList.do?order=all&pageNumber=1&pageSize=10");
		return mav;
	}
	
	@RequestMapping(value = "/qna/detail.do", method = RequestMethod.GET)
	public ModelAndView qnaDetail(int qna_idx, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		QnaVO qna = qnaService.getQnaDetail(qna_idx);
		ModelAndView mav = new ModelAndView();
		if(user == null){
			mav.setViewName("redirect:/index.do");
			return mav;
		}else{
			if(user.getUser_role() != 0){
				mav.setViewName("redirect:/index.do");
				return mav;
			}
		}
		mav.setViewName("qna/detail");
		mav.addObject("qna", qna);
		return mav ;
	}
	
	@RequestMapping(value = "/qna/qnaList.do")
	public ModelAndView getQnaList(String order, String pageNumber, String pageSize,HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
		UserVO user = (UserVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView("/qna/qnaList");
		if(user == null){
			mav.setViewName("redirect:/index.do");
			return mav;
		}else{
			if(user.getUser_role() != 0){
				mav.setViewName("redirect:/index.do");
				return mav;
			}
		}
		
		String url = request.getRequestURL().toString();
		int totalCount = qnaService.getTotalCount(order);
		Paging boardPaging = new Paging(pageNumber, pageSize , totalCount, url); // 페이징처리
		FirstRowPageSize  firstRowpageSize = new FirstRowPageSize(); // db limit 설정하기
		firstRowpageSize.setFirstRow(boardPaging.getBeginRow());
		firstRowpageSize.setPageSize(boardPaging.getPageSize());
		
		
		List<QnaVO> qnaList = qnaService.getQnaList(firstRowpageSize, order);
		
		mav.addObject("qnaList", qnaList);
		mav.addObject("paging", boardPaging);
		
		return mav;
	}
	
	
	
	public String sendMail(String email, String content) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(email);
			messageHelper.setText(content);
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);	// 메일제목은 생략이 가능
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}
		return "sucess";
	}
	
}
