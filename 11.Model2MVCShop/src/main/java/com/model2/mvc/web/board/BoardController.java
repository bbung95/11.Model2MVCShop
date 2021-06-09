package com.model2.mvc.web.board;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.CookieGenerator;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	/// Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	// setter Method 구현 않음

	public BoardController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("10")
	//@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "addBoard", method = RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/board/addBoard :: GET");

		return "redirect:/board/addBoardView.jsp";
	}

	@RequestMapping(value = "addBoard", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("board") Board board, Model model) throws Exception {

		System.out.println("/board/addBoard :: POST");
		
		// Business Logic
		boardService.addBoard(board);
		
		model.addAttribute("board", board);
		
		return "forward:/board/addBoard.jsp";
	}

	@RequestMapping(value = "getBoard")
	public String getBoard(@RequestParam("boardNo") int boardNo, Model model) throws Exception {

		System.out.println("/board/getBoard :: GET");

		// Model 과 View 연결
		model.addAttribute("board", boardService.getBoard(boardNo));

		return "forward:/board/getBoard.jsp";
	}

	@RequestMapping(value = "updateBoard", method = RequestMethod.GET)
	public String updateBoard(@RequestParam("boardNo") int boardNo, Model model) throws Exception {

		System.out.println("/board/updateBoard :: GET");

		// Model 과 View 연결
		model.addAttribute("board", boardService.getBoard(boardNo));

		return "forward:/board/updateBoard.jsp";
	}

	@RequestMapping(value = "updateBoard", method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute("board") Board board) throws Exception {

		System.out.println("/board/updateBoard :: POST");
		
		// Business Logic
		boardService.updateBoard(board);
		
		return "forward:/board/getBoard?boardNo="+board.getBoardNo();
	}

	@RequestMapping("listBoard")
	public String listBoard(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("/board/listBoard");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = boardService.getlistBoard(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/board/listBoard.jsp";
	}

	@RequestMapping("deleteBoard")
	public String deleteBoard(@RequestParam("boardNo") int boardNo) throws Exception {
		
		System.out.println("/boardNo/deleteBoardNo");
		
		boardService.deleteBoard(boardNo);
		
		return "forward:/board/listBoard";
	}

}
