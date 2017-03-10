/*package jp.seminar_copy.auth.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class authController {
	
	private static final Logger logger = LoggerFactory.getLogger(authController.class);
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value="error", required = false) String error,
			@RequestParam(value="logout", required = false) String logout){
		
		ModelAndView mv = new ModelAndView();
		
		if(error != null){
			mv.addObject("error", "Invalid userame and password");
		}
		
		if(logout != null){
			mv.addObject("msg", "you've been logged out successfully.");
		}
		
		mv.setViewName("auth/login");
		
		return mv;
	}
}
*/