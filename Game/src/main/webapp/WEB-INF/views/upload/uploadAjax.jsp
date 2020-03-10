<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.fileDrop {width:600px; height:200px; border:1px dotted blue;}
	small {margin-left:3px; font-weight:bold; color:gray;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//dragenter:마우스가 대상객체위에 처음진입시 발생
		//dragover:드래그하면서 마우스가 대상 객체위에 자리잡고있을때 발생
		$('.fileDrop').on("dragenter dragover", function(event){ 
			event.preventDefault(); //기본효과를 막음
		});
		//event : jQuery이벤트
		//originalEvent : javascript의 이벤트
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			//드래그의 파일의 정보
			var files = event.originalEvent.dataTransfer.files;
			//첫번째 파일
			var file = files[0];
			//콘솔에서 파일정보 확인
			console.log(file);
			
			//ajax로 전달할 폼 객체
			var formData = new FormData();
			//폼객체에 파일추가, append("변수명", 값)
			formData.append("file", file);
			
			$.ajax({
				type : "post",
				url : "${path}/upload/ajax.do",
				dataType : "text",
				//processData : true -> get방식 / false -> post방식
				//contentType : true -> application/x-www-form-urlencoded, false -> multipart/form-data
				processData : false,
				contentType : false,
				success : function(data){
					alert(data);
				}
			});
		});
	});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<h2>Ajax File Upload</h2>
	<div class="fileDrop"></div>
	<div class="uploadedList"></div>
</body>
</html>