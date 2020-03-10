package com.example.game.service.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.game.model.user.dao.UserDAO;
import com.example.game.model.user.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Inject
	UserDAO userDAO;
	
	@Override
	public Boolean loginChk(UserDTO dto, HttpSession session) throws Exception {
		boolean result = userDAO.loginChk(dto);
		if(result) {
			//UserDTO user = getUserName(dto.getName());
			session.setAttribute("userid", dto.getUserid());
			System.out.println(session.getAttribute("userid"));
		}
		return result;
	}
	
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	@Override
	public UserDTO getUser(UserDTO dto) throws Exception {
		return userDAO.getUser(dto);
	}
	
	@Override
	public void create(UserDTO dto) throws Exception {
		userDAO.create(dto);
	}
	
}
