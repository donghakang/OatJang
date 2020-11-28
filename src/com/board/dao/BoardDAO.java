package com.board.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.dto.BoardDTO;

public class BoardDAO {
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
	public void boardInsert(BoardDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("mybatis.BoardMapper.boardInsert",dto);
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

}
