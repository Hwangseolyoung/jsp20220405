<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- num1, num2 파라미터의 값을 더해서 출력하는 코드 작성
num1이나 num2의 파라미터가 겂다면 입력해달라는 메세지 출력 -->

<%
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");

if(num1 == null || num2 == null) {
%>
	<h1>두 수를 입력해주세요</h1>	
<%
} else {
	int i = Integer.parseInt(num1);
	int j = Integer.parseInt(num2);
	int sum = i + j;
	
%>
	<h3><%= i %> + <%= j %> = <%= sum %></h3>
<%
}
%>

</body>
</html>