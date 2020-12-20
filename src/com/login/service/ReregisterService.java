package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
<<<<<<< HEAD
=======
import com.login.dao.RegisterDAO;
>>>>>>> aa991cc... adbc
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class ReregisterService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
<<<<<<< HEAD

		LoginDTO dto = new LoginDTO();

		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddrId(Integer.parseInt(request.getParameter("addrId")));

		AddressDTO addr_dto = new AddressDTO();
		addr_dto.setAddrId(Integer.parseInt(request.getParameter("addrId")));
		addr_dto.setRoadFullAddr(request.getParameter("roadFullAddr"));
		addr_dto.setRoadAddrPart1(request.getParameter("roadAddrPart1"));
		addr_dto.setRoadAddrPart2(request.getParameter("roadAddrPart2"));
		addr_dto.setAddrDetail(request.getParameter("addrDetail"));
		addr_dto.setLat(Double.parseDouble(request.getParameter("lat")));
		addr_dto.setLng(Double.parseDouble(request.getParameter("lng")));

		LoginDAO dao = new LoginDAO();

		dao.updateUser(dto);
		dao.updateAddress(addr_dto);

		return "login/reRegisterOk.jsp";
=======
		
		System.out.println("reRegister!");
		
		String roadFullAddr = request.getParameter("roadFullAddr");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String addrDetail = request.getParameter("addrDetail");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		System.out.println("주소값 들어옴");
//		String addr = request.getParameter("addr1") + ", "
//				+ request.getParameter("addr2");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String phone = request.getParameter("phone");
		int addrId = Integer.parseInt(request.getParameter("addr"));
		
		LoginDTO loginDto = new LoginDTO();
		
		loginDto.setId(request.getParameter("id"));
		loginDto.setPw(request.getParameter("pw"));
		loginDto.setNickname(request.getParameter("nickname"));
		loginDto.setName(request.getParameter("name"));
		loginDto.setAge(Integer.parseInt(request.getParameter("age")));
		loginDto.setPhone(request.getParameter("phone"));
		loginDto.setAddrId(Integer.parseInt(request.getParameter("addr")));
		System.out.println("값 들어옴");
		AddressDTO addressDto = new AddressDTO();
		addressDto.setRoadFullAddr(roadFullAddr);
		addressDto.setRoadAddrPart1(roadAddrPart1);
		addressDto.setRoadAddrPart2(roadAddrPart2);
		addressDto.setAddrDetail(addrDetail);
		addressDto.setLat(lat);
		addressDto.setLng(lng);
		addressDto.setAddrId(addrId);
		
		
		
		
		System.out.println("id:" +loginDto.getId());
		System.out.println("pw:" +loginDto.getPw());
		System.out.println("nickname" +loginDto.getNickname());
		System.out.println("name:" +loginDto.getName());
		System.out.println("age:" +loginDto.getAge());
		System.out.println("phone:" +loginDto.getPhone());
		System.out.println("addrId:" +loginDto.getAddrId());
		
		
		System.out.println(loginDto);
		System.out.println("-----------------------------------------------");
		System.out.println(addressDto);

		RegisterDAO dao = new RegisterDAO();
		
		
		if(dao.mypageUpdate(loginDto, addressDto)) {
			return "index.jsp";
		}else {
			return "login/login.jsp";
		}
		
>>>>>>> aa991cc... adbc
	}

}
