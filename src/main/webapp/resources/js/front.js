
$('#btn_1').on("click", function(){
			var form = {
					name : "name",
					age : 23
			}
			$.ajax({
				url : "../main/requestObject.do",
				type : "post",
				data : form,
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "text",
				success : function(data){
					$('#result').text(data);
				},
				error : function(){
					alert("simpleWithObject error");
				}
			});
		});
		
		$('#btn_2').on('click', function(){
			$.ajax({
				url : "../main/serialize.do",
				type : "post",
				data : $('#frm').serialize(),
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "text",
				success : function(data){
					$('#result').text(data);
				},
				error : function(){
					alert("serialize error");
				}
			});
		});
		
		$('#btn_3').on('click', function(){
			var form = {
					name : "한글",
					age : 23
			}
			$.ajax({
				url : "../main/stringify.do",
				type : "post",
				data : JSON.stringify(form),
				contentType : "application/json; charset=UTF-8;",
				dataType : "json",
				success : function(data){
					var txt = data.name + data.age;
					$('#result').text(txt);
				},
				error : function(){
					alert("stringify error");
				}
			});
		});
		
		$('#btn_4').on('click', function(){
			var form = {
					name : "한글",
					age : 23
			}
			$.ajax({
				url : "../restController.do",
				type : "post",
				data : JSON.stringify(form),
				contentType : "application/json; charset=UTF-8;",
				dataType : "json",
				success : function(data){
					for(var i=0; i<data.length; i++){
						$('#result').append(data[i]+"<br>");
					}
				},
				error : function(){
					alert("restController error");
				}
			});
		});
		
		$('#btn_5').on('click', function(){
			var form2 = new FormData($('#frm2')[0]);
			$.ajax({
				url : "../main/file.do",
				type : "post",
				data : form2,
				contentType : false,
				dataType : false,
				success : function(data){
					for(var i=0; i<data.length; i++){
						$('#result').append(data[i]+"<br>");
					}
				},
				error : function(){
					alert("file error");
				}
			});
		});