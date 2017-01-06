package jp.seminar.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jp.seminar.user.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/test.do")
	public ModelAndView getBasicSeminarBoardList(Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar");
		
		log.debug("getBasciSeminarBoardList~~~~");
		
		List<Map<String, Object>> list = boardService.getBoardList(map);
		mv.addObject("list", list);
		
		return mv;
	}
}
