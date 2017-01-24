package jp.seminar.user.controller;

import java.text.DateFormat;
import java.util.Date;
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

import jp.seminar.user.model.UserVO;
import jp.seminar.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView join(UserVO joinUser) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/join");
		return mav ;
	}
	
	@RequestMapping(value = "/join_proc.do", method = RequestMethod.POST)
	public ModelAndView joinProc(UserVO joinUser) {
		
		int result = userService.userJoinProc(joinUser);
		System.out.println("result : " + result);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		
		return mav ;
	}
	
	@RequestMapping(value = "/login_proc.do", method = RequestMethod.POST)
	public ModelAndView loginProc(UserVO loginUser, HttpSession session) {
		
		int result = userService.userLoginProc(loginUser);
		if(result == 1){
			UserVO user = userService.getUserInfo(loginUser);
			session.setAttribute("user", user);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		
		return mav ;
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if(user != null)
			session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		
		return mav ;
	}
	
	
	
}
