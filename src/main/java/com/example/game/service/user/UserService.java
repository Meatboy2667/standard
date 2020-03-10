package com.example.game.service.user;

import javax.servlet.http.HttpSession;

import com.example.game.model.user.dto.UserDTO;

public interface UserService {
	public Boolean loginChk(UserDTO dto, HttpSession session) throws Exception;
	public void logout(HttpSession session) throws Exception;
	public UserDTO getUser(UserDTO dto) throws Exception;
	public void create(UserDTO dto) throws Exception;
}
