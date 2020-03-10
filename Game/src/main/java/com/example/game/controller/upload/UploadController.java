package com.example.game.controller.upload;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("upload/*")
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	//xml에 설정된 리소스 참조
	//bean의 id가  uploadPath인 태그를 참조
	@Resource(name="uploadPath")
	String uploadPath;
	
	//업로드 흐름 : 업로드 버튼클릭 -> 임시디렉토리에 업로드 -> 지정된 디렉토리에 저장 -> 파일정보가 file에 저장
	@RequestMapping(value="uploadForm.do", method=RequestMethod.GET)
	public void uploadForm() {
		// upload/uploadForm.jsp로 포워딩
	}
	
	@RequestMapping(value="uploadAjax.do", method=RequestMethod.GET)
	public void uploadAjax() {
		// upload/uploadAjax.jsp로 포워딩
	}
	
	@RequestMapping(value="upload.do", method=RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav) throws Exception {
		String savedName = file.getOriginalFilename();
		
		logger.info("파일이름 : "+file.getOriginalFilename());
		logger.info("파일크기 : "+file.getSize()+"Byte");
		logger.info("컨텐트 타입 : "+file.getContentType());
		
		//UUID랜덤생성 + 파일이름 저장
		//파일명 랜덤생성 메소드 호출
		savedName = uploadFile(savedName, file.getBytes());
		
		mav.setViewName("/upload/uploadResult");
		mav.addObject("savedName", savedName);
		
		return mav;
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		//UUID(Universally Unique Identifier,범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		//랜덤생성 +파일이름 저장
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		//임시디렉토리에 저장되어있는 업로드파일을 지정된 디렉토리로 복사
		//FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	//produces = "text/plain; charset=utf-8" : 파일 한글처리
	@ResponseBody
	@RequestMapping(value="ajax.do", method=RequestMethod.POST, produces="text/plain; charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
		logger.info("originalName : "+file.getOriginalFilename());
		logger.info("size : "+file.getSize());
		logger.info("contentType : "+file.getContentType());
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
}
