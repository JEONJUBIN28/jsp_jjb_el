<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<h1>JSTL 코어 연습</h1>
  	
  	<%
  		/*int num1 = 10;
  		pageContext.setAttribute("num1", 10); */
  	%>
  	
  	<c:set var ="num1" value="10" scope="session"/><!-- scope 미지정 시 기본적으로 pageScope에 담긴다. --> 
  	<c:set var ="num2" value="20"/>
  	
  	${num1}<br>
  	${num2}<br>
  	
  	<c:set var ="result" value="${num1 + num2}"/>
  	${result}<br>
  	<hr>
  	${sessionScope.num1}<br>
  	${pageScope.num2}<br>
 	<hr>
 	<%-- <c:remove var="num2"/>  --%>
 	${num1}<br>
  	${num2}<br>
  	
  	<h2>변수 출력</h2>
  	<c:set var ="name" value="홍길동"/>
  	${name}<br>
  	<c:out value="${name1}" default="없음"></c:out>
  	
  	<h2>조건문 if</h2>
  	
  	<c:if test="${num1 < num2}">
  		<p>넘투가 크다</p>
  	</c:if>
  	
  	<c:if test="${num1 eq num2}">
  		<p>num1과 num2가 같다</p>
  	</c:if>
  	
  	<c:if test="${name eq '홍길동'}">
  		<p>${name}입니다</p>
  	</c:if>
  	
  	<c:if test="${name ne '안녕하세요'}">
  		<p>안녕못합니다.</p>
  	</c:if>
  	
  	<h3>choose when</h3>
  	<c:choose>
	<%-- 이 주석만 가능하다. 읽히지 않는 주석이라. 하지만 다른 주석 쓰면 에러가 난다. choose다음엔 when을 쓸 것 --%>
   	<c:when test="${num1 > 5}">
      	num1이 5보다 크다
   	</c:when> 
   	<c:when test="${num2 < 100}">
      	snum2가 100보다 작다
   	</c:when>
   	<c:otherwise>
      	num1이 5보다 크지도 100보다 작지도 않다.
   	</c:otherwise>
   	</c:choose>
   <!-- 	for(int cnt = 0; cnt<10; cnt++){
   	System.out.println("야호.")
   	} -->
	
	<%-- <c:forEach> 커스텀 액션 사용 방법 --%>	
	
	<c:forEach var="i" begin="1" end="10">
		<p>안녕하세요 + ${i}</p>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		<p>안녕하세요 + ${i}</p>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>안녕하세요</h${i}>
	</c:forEach>
  	
  	<%
  		String[] arr = {"해삼", "멍개", "미역", "다래"};
  		pageContext.setAttribute("menuArr", arr);
  		
  		Map<String, Integer> map = new HashMap<>();
  		
  		map.put("a", 100);
  		map.put("b", 200);
  		map.put("c", 300);
  		map.put("d", 400);
  		
  		pageContext.setAttribute("map", map);
  		
  		List<String> list = new ArrayList<>();
  		list.add("사과");
  		list.add("배");
  		
  		session.setAttribute("list", list);
  		
  	%>
  	
  	<c:forEach var="menu" items="${menuArr}">
  		${menu}<br>
  	</c:forEach>
  	<hr>
  	<c:forEach var="testmap" items="${map}"> 
  		${testmap.key}:${testMap.value}<br>
  	</c:forEach>
  	<hr>
  	<c:forEach var="fruit" items="${list}"> 
  		${fruit}<br>
  	</c:forEach>
  	
   
</body>
</html>