package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.BookService;
import kr.co.hotel.vo.BookVO;

/**
 * 
 * @author 장현석
 *
 */
@Controller
public class BookController {

	@Autowired
	@Qualifier("bs")
	private BookService service;

	/**
	 * 
	 * @return 날짜 선택, 투숙 인원을 선택할수 있도록 book 페이지 반환
	 */
	@RequestMapping("/book/book")
	public String book() {
		return "/book/book";
	}

	/**
	 * 
	 * @param request
	 *            book에서 날짜, 투숙인원을 받
	 * @param model
	 *            db에서 예약가능한 방을 받아옴
	 * @param session
	 *            세션에서 userid를 받아옴
	 * @return 객실을 선택할수 있는 book1 페이지 반환
	 */
	@RequestMapping("/book/book1")
	public String book1(HttpServletRequest request, Model model, HttpSession session) {

		return service.book1(request, model, session);
	}

	/**
	 * 
	 * @param bvo
	 *            BookVO를 사용
	 * @param model
	 *            선택된 객실의 정보를 가져옴
	 * @return 객실은 선택하고 예약완료 book3 페이지를 반환
	 */
	@RequestMapping("/book/book2")
	public String book2(BookVO bvo, Model model) {

		return service.book2(bvo, model);
	}

	/**
	 * 
	 * @param bvo
	 *            BookVO를 사용
	 * @param model
	 *            예약완료된 객실 정보를 가져옴
	 * @param session
	 *            userid를 ㅇdb에 저장
	 * @return 예약완료 book3를 반환
	 */
	@RequestMapping("/book/book3")
	public String book3(BookVO bvo, Model model, HttpSession session) {

		return service.book3(bvo, model, session);
	}

	/**
	 * 
	 * @param model db에서 userid를 조회해서 받아옴
	 * @param session userid를 받아옴
	 * @return 예약리스트를 반환
	 */
	@RequestMapping("/book/list")
	public String list(Model model, HttpSession session) {

		return service.list(model, session);
	}

	/**
	 * 
	 * @param request salescode를 받아감
	 * @param model db에서 salescode로 조회된 자료를 받아옴
	 * @return 예약 상세 페이지 반환
	 */
	@RequestMapping("/book/book_view")
	public String book_view(HttpServletRequest request, Model model) {

		return service.book_view(request, model);
	}

	/**
	 * 
	 * @param request salescode를 받아감
	 * @return 받아간 salescode를 삭제한 리스트를 받아옴
	 */
	@RequestMapping("/book/book_cancel")
	public String book_cancel(HttpServletRequest request) {

		return service.book_cancel(request);
	}

}
