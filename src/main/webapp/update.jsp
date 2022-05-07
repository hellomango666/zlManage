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
 	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
  </head>
 <body>       
			<div id="con">
				姓名：
				<input type="text" id="eName" value="${loginUser.eName}"><p>
				年龄：
				<input type="text" id="age" value="${loginUser.age}"><p>				
				性别：
				<input type="text" id="sex" value="${loginUser.sex}"><p>
				联系电话：
				<input type="text" id="phone" value="${loginUser.phone}"><p>

				<c:if test="${loginUser.role.rId==100}">			
				家庭住址：
				<input type="text" id="address" value="${loginUser.address}"><p>
				</c:if>
				<input type="hidden" id="rId" value="${loginUser.role.rId }"/><p>	
				<input type="hidden" id="eId" value="${loginUser.eId}"/><p>
				<input class="btn btn-primary" type="button" value="提交" onclick="javascript:up(${loginUser.role.rId})"/>						
			</div>

			<!-- 底部页脚部分 -->
 <div class="footer">
 </div>
 </body>
 <script type="text/javascript">
function up(rId){
	 var eName = $("#eName").val();
	 var age = $("#age").val();
	 var sex = $("#sex").val();
	 var phone = $("#phone").val();
	 var address = $("#address").val();
	 var rId = $("#rId").val();
	 var eId=$("#eId").val();
	 alert(rId)
	 alert(eName+age+sex+phone+address+eId)
	 if(rId==100){
		 $.ajax({
			  method: "POST",
			  url: "stu/upStu.do",
			  data: {"eName":eName,"age":age,"sex":sex,"phone":phone,"address":address,"eId":eId,"rId":100}
			 }).done(function(msg) {
			   if(msg==1){
				  location.href="stu/findStuById.do?eId="+eId+"&rId="+rId;
			   }else{
				   alert("修改失败")
			   }		
		})
	 }else{
		 $.ajax({
			  method: "POST",
			  url: "stu/upEmp.do",
			  data: {"eName":eName,"age":age,"sex":sex,"phone":phone,"eId":eId,"rId":rId}
			 }).done(function(msg) {
				 if(msg==1){
					 location.href="stu/findStuById.do?eId="+eId+"&rId="+rId;
				   }else{
					   alert("修改失败")
				   }				
		})
	 }	 
}
 
 </script>
</html>
