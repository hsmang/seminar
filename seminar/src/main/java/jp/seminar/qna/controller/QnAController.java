package jp.seminar.qna.controller;

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
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/qna.do", method = RequestMethod.GET)
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/qna");
		return mav ;
	}
	
}
