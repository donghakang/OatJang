package com.login.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.dto.BoardDTO;
import com.login.dto.LoginDTO;

public class LoginDAO {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			System.out.println(resource);
			Reader reader = Resources.getResourceAsReader(resource);
			System.out.println(reader);
			factory = new SqlSessionFactoryBuilder().build(reader);

		} catch (IOException e) {
		}
	}
	// ----------------------------------------------------------------------
	public LoginDTO getLoginUser(String id, String pw) {
		SqlSession session = factory.openSession();
		LoginDTO dto = new LoginDTO();
		dto.setId(id);
		dto.setPw(pw);
		LoginDTO entity = session.selectOne("mybatis.LoginMapper.getLoginUser",
				dto);
		session.close();
		return entity;
	}
	
	//회원정보수정
	public void mypageUpdate(LoginDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.LoginMapper.mypageUpdate",dto);
			if(n>0) {
				session.commit();
			}
		}catch(Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
	}

	// id, phone으로 비밀번호 찾기
	public LoginDTO findPassword(String id, String phone) {
		SqlSession session = factory.openSession();
		LoginDTO dto = new LoginDTO();
		dto.setId(id);
		dto.setPhone(phone);
		LoginDTO entity = session.selectOne("mybatis.LoginMapper.getUserPassword", dto);
		session.close();

		return entity;
	}
//name, age로 아이디 찾기
	public LoginDTO findId(String name, int age) {
		SqlSession session = factory.openSession();
		LoginDTO dto = new LoginDTO();
		dto.setName(name);
		dto.setAge(age);
		LoginDTO entity = session.selectOne("mybatis.LoginMapper.getUserId",
				dto);
		session.close();
		return entity;
	}
			
}
