<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>Insert title here</title>
</head>
<body>
	<h1>list의 item이 list type일때</h1>
	
	<%
	List<List<String>> list = new ArrayList<>();
	
	List<String> item1 = new ArrayList<>();
	List<String> item2 = new ArrayList<>();
	
	// list item을 list에 담아준다.
	list.add(item1);
	list.add(item2);
	
	item1.add("winter");
	item1.add("summer");
	item1.add("spring");
	
	item2.add("jimin");
	item2.add("sugar");
	item2.add("v");
	
	pageContext.setAttribute("list", list);
	%>
	
	<p>${list[0][0] }</p>
	<p>${list[0][1] }</p>
	<p>${list[0][2] }</p>
	<p>${list[1][0] }</p>
	<p>${list[1][1] }</p>
	<p>${list[1][2] }</p>
</body>
</html>