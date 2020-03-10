package com.example.game.model.user.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.game.model.user.dto.UserDTO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginChk(UserDTO dto) throws Exception {
		String chk = sqlSession.selectOne("user.loginChk", dto);
		return (chk==null) ? false : true;
	}
	
	@Override
	public UserDTO getUser(UserDTO dto) throws Exception {
		return sqlSession.selectOne("user.getUser", dto);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
	}
	
	@Override
	public void create(UserDTO dto) throws Exception {
		sqlSession.insert("user.create", dto);
	}
}
