package com.example.game.controller.main;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.game.model.main.dto.MainDTO;

@RestController
public class AjaxRestController {
	
	@PostMapping("restController.do")
	public Object restController(@RequestBody MainDTO dto) throws Exception{
		ArrayList<String> arrList = new ArrayList<String>();
		for(int i=0; i<5; i++) {
			arrList.add(dto.getName()+" "+dto.getAge()+" "+i);
		}
		return arrList;
	}
}
