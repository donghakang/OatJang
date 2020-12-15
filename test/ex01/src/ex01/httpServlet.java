package ex01;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class httpServlet
 */
@WebServlet(name = "httpServlet", urlPatterns = {"/httpServlet"})
public class httpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ArrayList<BoardDTO> items = new ArrayList<>();
		int iid = 1;
		String title = "구남초등학교";
		int price = 25000;
		String description = "구남초등학교";
		int category = 4;
		int success = 1;
		String bid = "강동하";
		int hit = 43;
		String addr = "서울특별시 광진구 구의강변로 69(구의동)";
		double coordX = 37.537336752559675;
		double coordY = 127.092231582778;

		BoardDTO dto = new BoardDTO();
		dto.setIid(iid);
		dto.setTitle(title);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setCategory(category);
		dto.setSuccess(success);
		dto.setBid(bid);
		dto.setHit(hit);
		dto.setAddr(addr);
		dto.setCoordX(coordX);
		dto.setCoordY(coordY);

		items.add(dto);

		// ---
		iid = 2;
		title = "우리집";
		price = 30000;
		description = "중고나라에서 사고 다시팝니다. 상태 9/10";
		category = 2;
		success = 1;
		bid = "송아";
		hit = 43;
		String addr2 = "서울특별시 광진구 구의강변로3길 16(구의동, (주)파르네빌아파트)";
		coordX = 37.53621073256719;
		coordY = 127.09133561346304;

		dto = new BoardDTO();
		dto.setIid(iid);
		dto.setTitle(title);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setCategory(category);
		dto.setSuccess(success);
		dto.setBid(bid);
		dto.setHit(hit);
		dto.setAddr(addr2);
		dto.setCoordX(coordX);
		dto.setCoordY(coordY);

		items.add(dto);

		// ---
		iid = 3;
		title = "헬스기구";
		price = 30000;
		description = "직거래 선호  상태 9/10";
		category = 1;
		success = 1;
		bid = "푸";
		hit = 21;
		String addr3 = "강변 스파랜드";
		int addrId = 1;

		coordX = 37.534772635848725;
		coordY = 127.0917253422989;

		dto = new BoardDTO();
		dto.setIid(iid);
		dto.setTitle(title);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setCategory(category);
		dto.setSuccess(success);
		dto.setBid(bid);
		dto.setHit(hit);
		dto.setAddr(addr3);
		dto.setCoordX(coordX);
		dto.setCoordY(coordY);

		items.add(dto);

		request.setAttribute("t", "TITLE");
		request.setAttribute("itemList", items);

		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);

	}
}
