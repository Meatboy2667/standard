<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.res {border:1px solid black; width:200px; height:200px; position:absolute; top:20%; right:10%; text-align:center;}
	#result {border-top:1px solid gray;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<button id="btn_1" type="button" class="btn btn-warning btn-sm">simpleWithObject</button>
	<form id="frm">
		name : <input type="text" name="name" id="name"><br />
		age : <input type="text" name="age" id="age">
	</form>
	<button id="btn_2" type="button" class="btn btn-success btn-sm">serialize</button><br />
	<button type="button" id="btn_3" class="btn btn-primary btn-lg">stringify</button><br />
	<button type="button" id="btn_4" class="btn btn-info btn-xs">restController</button><br />
	<form id="frm2" enctype="multipart/form-data">
		<input multiple="multiple" type="file" id="images" name="images">
	</form>
	<button type="button" id="btn_5" class="btn btn-danger btn-xs">file</button> 
	<div class="res">
		<h3>결과창</h3>
		<div id="result"></div>
	</div>
<script src="${path}/resources/js/front.js"></script>
</body>
</html>