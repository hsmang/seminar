package jp.seminar.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import jp.seminar.paging.Paging;
import jp.seminar.paging.FirstRowPageSize;
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
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(String type) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		mav.addObject("type", type);
		return mav ;
	}
	
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
		//mav.setViewName("redirect:/index.do");
		mav.setViewName("jsonView");
		if(result != 1){
			mav.addObject("result", false);
		}else{
			mav.addObject("result", true);
		}
		
		return mav ;
	}
	
	@RequestMapping(value = "/login_proc.do", method = RequestMethod.POST)
	public ModelAndView loginProc(UserVO loginUser, HttpServletRequest request, HttpSession session) {
		
		int result = userService.userLoginProc(loginUser);
		if(result == 1){
			UserVO user = userService.getUserInfo(loginUser);
			session.setAttribute("user", user);
		}
		ModelAndView mav = new ModelAndView();
		String referer_url = request.getHeader("REFERER");
		// domain setting update..
		String url = referer_url.substring(referer_url.indexOf("8080") + 4);
		mav.setViewName("redirect:" + referer_url);
		
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
	
	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public ModelAndView user_info(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		if(user == null){
			mav.setViewName("redirect:/index.do");
		}else{
			mav.addObject("user", user);
			mav.setViewName("/user/info");
		}
		
		return mav ;
	}
	
	@RequestMapping(value = "/update_proc.do", method = RequestMethod.POST)
	public ModelAndView updateProc(HttpSession session, UserVO updateUser) {
		UserVO user = (UserVO) session.getAttribute("user");
		updateUser.setUser_idx(user.getUser_idx());
		int result = userService.userUpdateProc(updateUser);
		session.setAttribute("user", updateUser);
		System.out.println("result : " + result);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		
		return mav ;
	}
	
	@RequestMapping(value = "/userList.do")
	public ModelAndView getUserList(String order, String pageNumber, String pageSize,HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
		UserVO user = (UserVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView("/user/userList");
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
		int totalCount = userService.getTotalCount(order);
		System.out.println(totalCount);
		Paging boardPaging = new Paging(pageNumber, pageSize , totalCount, url); // 페이징처리
		FirstRowPageSize  firstRowpageSize = new FirstRowPageSize(); // db limit 설정하기
		firstRowpageSize.setFirstRow(boardPaging.getBeginRow());
		firstRowpageSize.setPageSize(boardPaging.getPageSize());
		
		
		List<UserVO> userList = userService.getUserList(firstRowpageSize, order);
		
		mav.addObject("userList", userList);
		mav.addObject("paging", boardPaging);
		
		return mav;
	}
	
	@RequestMapping(value = "/role_change.do", method = RequestMethod.POST)
	public ModelAndView roleChangeProc(HttpServletRequest request, HttpSession session, UserVO updateUser) {
		ModelAndView mav = new ModelAndView();
		UserVO user = (UserVO) session.getAttribute("user");
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
		String old_url = request.getHeader("REFERER");
		int result = userService.userRoleProc(updateUser);
		
		mav.setViewName("jsonView");
		mav.addObject("result",true);
		return mav ;
	}
	
	@RequestMapping(value = "/state_change.do", method = RequestMethod.POST)
	public ModelAndView stateChangeProc(HttpServletRequest request, HttpSession session, UserVO updateUser) {
		ModelAndView mav = new ModelAndView();
		UserVO user = (UserVO) session.getAttribute("user");
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
		String old_url = request.getHeader("REFERER");
		int result = userService.userStateProc(updateUser);
		
		mav.setViewName("jsonView");
		mav.addObject("result",true);
		return mav ;
	}
	
}
