<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formobj = $("form[name='readForm']");
			
			listReply("1");
			//listReply2();
			
			//1.첨부파일 목록 불러오기 함수 호출
			listAttach();
			
			//2.첨부파일 추가 ajax요청
			$("#fileDrop").on("dragenter dragover", function(e){
				e.preventeDefault();
			})
			$("#fileDrop").on("drop", function(e){
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
			
			//3.첨부파일 삭제 ajax요청
			//태그.on("이벤트", "자손태그", 이벤트 핸들러)
			$("#uploadList").on("click", ".fileDel", function(e){
				var that = $(this);
				$.ajax({
					type:"post",
					url :"${path}/upload/deleteFile",
					data : {fileName : $(this).attr("data-src")},
					dataType : "text",
					success : function(result){
						if(result == "deleted"){
							that.parent("div").remove;	
						}
					}
				})
			});
		
			
			$("#reply_btn").click(function() {
				var replytext = $("#replytext").val();
				var seq = "${dto.seq}";
				var param = "replytext="+replytext+"&seq="+seq;
				$.ajax({
					type : "post",
					url : "${path}/reply/insert.do",
					data : param,
					success : function() {
						alert("댓글 등록완료");
						listReply("1");
						location.href="${path}/board/list.do";
					}
				})
			})
			
			$('#list_btn').on("click", function(){
				location.href="${path}/board/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
			})
			
			$(".update_btn").on("click", function(){
				formobj.attr("action", "${path}/board/updateView.do");
				formobj.attr("method", "post");
				formobj.submit();
			})
			
			$(".delete_btn").on("click", function(){
				
				var deleteYn = confirm("삭제하시겠습니까?");
				if(deleteYn == true){
					formobj.attr("action", "${path}/board/deleteBoard.do");
					formobj.attr("method", "post");
					formobj.submit();
				}
			})
			
		});
		
		function listReply(num){ //@Controller방식 / 댓글목록 1
			$.ajax({
				type : "get",
				url : "${path}/reply/list.do?seq=${dto.seq}&curPage="+num,
				success : function(result){
					//responseText가 result에 저장됨
					$(".listReply").html(result);
				}
			});
		}
		
		function listReply2(){
			$.ajax({
				type : "get",
					//contentType : "application/json", ==> 생략가능(RestController이기때문에 가능)
				url : "${path}/reply/listJson.do?seq=${dto.seq}",
				dataType : "json",
				success : function(result){
					console.log(result);
					var output = "<table>";
					for(var i in result){ // result에 값이 있을경우
						output += "<tr>";
						output += "<td>"+result[i].name;
						output += "("+changeDate(result[i].regDate)+")<br>";
						output += result[i].replytext+"</td>";
						output += "<tr>";
					}
					output += "</table>";
					$(".listReply").html(output);
				}
			});	
		}
		
		function changeDate(date){
			date = new Date(parseInt(date));
			year = date.getFullYear();
			month = date.getMonth();
			day = date.getDate();
			hour = date.getHours();
			minute = date.getMinutes();
			second = date.getSeconds();
			strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
			return strDate;
		}
		
	</script>
	<style>
		#fileDrop{width:600px; height:80px; border:1px solid gray; background-color:gray;}
	</style>
	<body>
	<%@ include file="../include/menu.jsp" %>
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" name="readForm" id="readForm">
					<input type="hidden" id="seq" name="seq" value="${dto.seq}" readonly="readonly"/>
				</form>
					<table>
						<tbody>	
							<tr>
								<td>
									<label for="title">제목</label>
									<input type="text" id="title" name="title" value="${dto.title}" readonly="readonly"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label>
									<textarea id="content" name="content" readonly="readonly"><c:out value="${dto.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label>
									<input type="text" id="writer" name="writer" value="${dto.writer}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="regDate">작성날짜</label>
									<fmt:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<!-- <tr>
								<td><div>첨부파일<div id="uploadList"></div></div></td>
							</tr> -->		
						</tbody>
					</table>
				<div>
					<button type="button" id="list_btn">게시글 목록</button>
					<c:if test="${sessionScope.userid == dto.writer}">
						<button type="submit" class="update_btn">수정</button>
						<button type="submit" class="delete_btn">삭제</button>
					</c:if>
				</div>
			</section>
		</div>
		<div style="width:650px; text-align:center;">
			<br>
			<c:if test="${sessionScope.userid != null}">
				<textarea rows="5" cols="50" id="replytext" name="replytext" placeholder="댓글을 작성하는 란입니다."></textarea>
				<br>
				<button type="button" id="reply_btn">댓글 작성</button>
			</c:if>
		</div>
		<div class="listReply"></div>
	<%@ include file="../include/footer.jsp" %>
	</body>
</html>