package com.example.game.controller.main;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.game.model.main.dto.AjaxFile;
import com.example.game.model.main.dto.MainDTO;

@Controller
@RequestMapping("main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("front.do")
	public String front() {
		return "main/front";
	}
	
	@RequestMapping(value="requestObject.do", method=RequestMethod.POST)
	@ResponseBody
	public String simpleWitdObject(MainDTO dto) {
		return dto.getName() + dto.getAge();
	}
	
	@RequestMapping(value="serialize.do", method=RequestMethod.POST)
	@ResponseBody
	public String serialize(MainDTO dto) throws Exception{
		String name = URLDecoder.decode(dto.getName(), "UTF-8");
		return name + dto.getAge();
	}
	
	@RequestMapping(value="stringify.do", method=RequestMethod.POST)
	@ResponseBody
	public Object stringify(@RequestBody MainDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", dto.getName());
		map.put("age", dto.getAge());
		return map;
	}
	
	@RequestMapping(value="file.do", method=RequestMethod.POST)
	@ResponseBody
	public Object file(AjaxFile file) {
		List<MultipartFile> list = file.getImages();
		ArrayList<String> fileNameList = new ArrayList<String>();
		for(MultipartFile mf : list) {
			fileNameList.add(mf.getOriginalFilename());
		}
		return fileNameList;
	}
	
	@RequestMapping("ajax.do")
	public String ajax() {
		return "main";
	}
	
	@RequestMapping(value="ajaxView1", method=RequestMethod.POST)
	public String view1(Locale locale) {
		logger.info("ajaxView1", locale);
		return "main/view1";
	}
	
	@RequestMapping(value="ajaxView2", method=RequestMethod.POST)
	public String view2(Locale locale) {
		logger.info("ajaxView2", locale);
		return "main/view2";
	}
	
}
