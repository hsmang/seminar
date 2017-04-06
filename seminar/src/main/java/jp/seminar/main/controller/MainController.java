package jp.seminar.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jp.seminar.board.vo.BoardVO;
import jp.seminar.dataBoard.service.DataBoardService;
import jp.seminar.main.service.BoardService;
import jp.seminar.paging.FirstRowPageSize;
import jp.seminar.user.model.UserVO;
import jp.seminar.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	@Resource(name = "mainService")
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		FirstRowPageSize firstRowpageSize = new FirstRowPageSize(0,1);
		List<BoardVO> list = boardService.selectList(firstRowpageSize);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("product", list.get(0));
		mav.addObject("contest", list.get(1));
		mav.addObject("album", list.get(2));
		mav.addObject("seminarList", list.get(3));
		mav.addObject("adminList", list.get(4));
		mav.addObject("strategyList", list.get(5));
		mav.addObject("systemList", list.get(6));
		return mav ;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		return mav ;
	}
	
}
