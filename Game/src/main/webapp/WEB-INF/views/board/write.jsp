<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
<style>
	table {border:1; border-spacing:1; width:300px;}
	section {text-align:center;}
	section>div {width:300px; margin:10px auto;}
	section .filedrop {text-align:left;}
	label {display:inline-block;width:50px; text-align:center;}
	table tr:nth-child(2) td label {vertical-align:middle;}
	.fileDrop {width:450px; height:70px; border:2px dotted gray; background-color:gray;}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$("#write_btn").on("click", function() {
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "${path}/board/insertBoard.do");
			formObj.attr("method", "post");
			formObj.submit();			
		});
		
		$("#list_btn").on("click", function(){
			location.href="${path}/board/list.do";
		});
		
		$(".fileDrop").on("dragenter dragover", function(e){
			e.preventDefault(); //기본효과 제한
		});
		
		//드래그해서 드롭한 파일들 ajax 업로드 요청
		$(".fileDrop").on("drop", function(e){
			e.preventDefault();//기본효과 제한
			var files = e.originalEvent.dataTransfer.files; //드래그한 파일들
			var file = files[0]; //첫번째 첨부파일
			var formData = new FormData(); //폼데이터 객체
			formData.append("file", file); //첨부파일 추가
			$.ajax({
				url : "${path}/upload/ajax.do",
				type : "post",
				data : formData,
				dataType : "text",
				processData : false, //processData : false - header가 아닌 body로 전달
				contentType : false,
				success : function(data){
					console.log(data);
					//첨부파일의 정보
					var fileInfo = getFileInfo(data);
					//하이퍼 링크
					var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br />";
					//hidden태그 추가
					html += "<input type ='hidden' class='file' value='"+fileInfo.fullName+"'>";
					//div에 추가
					$("#uploadList").append(html);
				},
				error : function(){
					console.log("ajax error");
				}
			});
		})
	});
	function fn_valiChk(){
		var regForm = $("form[name='writeForm'] .chk").length;
		for(var i=0; i<regForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				$(".chk").eq(i).focus();
				return true;
			}
		}
	}
	
</script>
<body>
<%@ include file="../include/menu.jsp" %>
<section>
	<h1>글작성 페이지입니다</h1>
	<div>
		<form id="writeForm" name="writeForm" enctype="multipart/form-data">
			<table>
				<tr>
					<td><label for="title">제목</label></td>
					<td><input type="text" id="title" name="title" size="28" class="chk" title="제목을 입력하세요"/></td>
				</tr>
				<tr>
					<td><label for="content">내용</label></td>
					<td><textarea id="content" name="content" rows="10" cols="30" class="chk" title="내용을 입력하세요"></textarea></td>
				</tr>
				<!-- <tr>
					<td><label for="writer">작성자</label></td>
					<td><input type="text" id="writer" name="writer" size="28" class="chk" title="작성자를 입력하세요"/></td>
				</tr> -->
				<!-- <tr>
					<td rowspan="2">첨부파일</td>
					<td><div class="fileDrop"></div></td>
					<td><input type="file" name="file" id="file"></td>
				</tr>
				<tr>
					<td><div id="uploadList"></div></td>
				</tr> -->
				<tr>
					<td colspan="2" align="center">
					<button type="submit" class="btn btn-primary btn-sm" id="write_btn">작성하기</button>
					<button type="button" class="btn btn-primary btn-sm" id="list_btn">목록으로</button>
					</td>
				</tr>
			</table>
		</form>
		<!-- 첨부파일
		<div class="fileDrop"></div>
		<div id="uploadList"></div>
		<button class="write_btn" type="submit" >작성</button> -->
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
<script src="${path}/resources/js/common.js"></script>
</body>
</html>