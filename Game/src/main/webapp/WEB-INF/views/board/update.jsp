<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href="${path}/board/list.do";
		})
		
		$(".update_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "${path}/board/updateBoard.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i=0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				$(".chk").eq(i).focus();
				return true;
			}
		}
	}
</script>
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container">
			<form name="updateForm" role="form">
				<input type="hidden" name="seq" value="${update.seq}"
					readonly="readonly" />
				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="title" value="${update.title}" class="chk" title="제목을 입력해주세요"/></td>
						</tr>
						<tr>
							<td><label for="content">내용</label>
							<textarea id="content" name="content" class="chk" title="내용을 입력해주세요">
							<c:out value="${update.content}"/></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label><input type="text"
								id="writer" name="writer" value="${update.writer}"
								readonly="readonly"/></td>
						</tr>
						<tr>
							<td><label for="regDate">작성날짜</label> <fmt:formatDate
									value="${update.regDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</tbody>
				</table>
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>