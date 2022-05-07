<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入jQuery -->
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<!-- 引入样式 -->
 	<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 	<style>
 	#con{
 	/* border:1px solid red; */
 	width:800px;
 	height:650px;
 	margin-left:400px;
 	}
 	body{font-size:12pt;line-height:2}
 	</style>
  </head>
 <body>
			<div id="con">
				编号：
				<span>${user.eNum}</span><p>
				姓名：
				<span>${user.eName}</span><p>
				性别：
				<span>${user.sex}</span><p>
				密码：
				<span>${user.age}</span><p>
				身份信息：
				<span>${user.role.rName}</span><p>
				联系电话：
				<span>${user.phone}</span><p>
				注册日期：
				<span><fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span><p>			
				所在部门：
				<span>${user.dept.dName}</span><p>
				审核状态：
				<span>
				<c:if test="${loginUser.isGo==0}">
				 未审核
				</c:if>
				<c:if test="${user.isGo==1}">
				已通过
				</c:if>
				</span><p>
				
				
				
				<c:if test="${user.role.rId==100}">
				家庭住址：
				<span>${user.address}</span><p>				
				入学日期：
				<span><fmt:formatDate value="${user.schoolDate}" pattern="yyyy-MM-dd"/></span><p>
				所在班级：
				<span>${user.classes.cName}</span><p>				
				阶段1成绩：
				<span>${user.score1}</span><p>
				阶段2成绩：
				<span>${user.score2}</span><p>
				阶段3成绩：
				<span>${user.score3}</span><p>
				</c:if>	
				
				<c:if test="${user.role.rId!=100}" >
				入职日期：
				<span><fmt:formatDate value="${user.hireDate}" pattern="yyyy-MM-dd"/></span><p>
				薪资：
				<span>${user.sal}</span><p>				
			  </c:if>							
			</div>

			<!-- 底部页脚部分 -->
 <div class="footer">
 </div>
    </body>
</html>
