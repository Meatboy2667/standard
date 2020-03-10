package com.example.game.controller.boot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("boot/*")
public class BootController {

	@RequestMapping("choice.do")
	public String choice() {
		return "/choice/buttonChoice";
	}
	
	@RequestMapping("text.do")
	public String textT() {
		return "/choice/textT";
	}
	
	@RequestMapping("table.do")
	public String tableT() {
		return "/choice/tableT";
	}
}
