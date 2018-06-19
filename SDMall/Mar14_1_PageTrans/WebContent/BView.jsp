<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function go(bh, yu){
		location.href = "CController?aa="+bh+"&bb="+yu;
	}	
</script>
</head>
<body>
	<h1>BView</h1>
	<a href="CController?aa=test&bb=33">GET방식 요청</a> <p>
	
	<hr>
	
	<button onclick="go('ㅋㅋ', 11);">GET방식 요청</button> <p>
	
	<hr>
	
	<form action="CController">
		<input name="aa"> <br>
		<input name="bb"> <br>
		<input type="submit" value="GET방식 요청">
	</form>
	
</body>
</html>







