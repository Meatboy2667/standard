var sendAjax = function(url) {
	
	var postString = "";
	
	$.ajax({
		type:'post',
		url : url,
		data : postString,
		success : function(msg){ // msg에 view페이지에 대한 정보가 담겨있다. 그래서 innerHTML = msg는 곧 출력하고싶은곳에 해당페이지의 내용을 전부 출력
			document.getElementById('changeView').innerHTML = msg;
		},
		error : function(){
			alert("ajax error");
		}
	});
	
}
/*
$('.aView1').on("click", function(){
	
	var postString = "";
	
	$.ajax({
		type:'post',
		url : "ajaxView1",
		data : postString,
		success : function(msg){ // msg에 view페이지에 대한 정보가 담겨있다. 그래서 innerHTML = msg는 곧 출력하고싶은곳에 해당페이지의 내용을 전부 출력
			document.getElementById('changeView').innerHTML = msg;
		},
		error : function(){
			console.log();
			alert("ajax error");
		}
	});
});*/