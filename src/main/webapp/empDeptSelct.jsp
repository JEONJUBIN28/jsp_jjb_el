<%@page import="edu.ict.prj.vo.EmpDeptDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "edu.ict.prj.dao.EmpDeptDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<h1>empDeptSelcet 페이지입니다.</h1>
  	
  	<%
  	EmpDeptDao empDeptDao = new EmpDeptDao();
  	ArrayList<EmpDeptDto> dtos = empDeptDao.empDeptSelect();
  	
  	pageContext.setAttribute("empDeptList", dtos);
  	%>
  	
  	<c:forEach var="empDept" items="${empDeptList}">
  		사원번호 : ${empDept.getEmpno()}
  		사원이름 : ${empDept.getEname()}
  		부서명 : ${empDept.getDname()}
  		부서위치 : ${empDept.getLoc()}<br>
  	</c:forEach>
  
   
</body>
</html>