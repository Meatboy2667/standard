package com.example.game.model.user.dao;

import javax.servlet.http.HttpSession;

import com.example.game.model.user.dto.UserDTO;

public interface UserDAO {
	public boolean loginChk(UserDTO dto) throws Exception;
	public UserDTO getUser(UserDTO dto) throws Exception;
	public void logout(HttpSession session) throws Exception;
	public void create(UserDTO dto) throws Exception;
}
