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
	
	@RequestMapping(value = "/seminar.do")
	public ModelAndView getBasicSeminarBoardList(Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar");
		
		List<Map<String, Object>> list = boardService.getBoardList(map);
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value = "/seminar/insert.do")
	public ModelAndView getBasicSeminarBoardInsert(Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar_insert");
		
		return mv;
	}
	
	@RequestMapping(value = "/seminar/detail.do")
	public ModelAndView getBasicSeminarBoardDetail(Map<String, Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("/board/basicSeminar_detail");
		
		List<Map<String, Object>> list = boardService.getBoardDetail(map);
		mv.addObject("list", list);
		
		return mv;
	}
	
}
