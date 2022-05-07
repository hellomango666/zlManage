<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript"
	src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
<style>
td {
	font-size: 14px;
	width: 38px;
	height: 30px; //
	border: 1px solid black;
}
</style>
</head>
<body>                       
				<div class="table-responsive">
					<table class="table table-striped ">
						<thead>
							<tr>
								<th>ID</th>
								<th>编号</th>
								<th>姓名</th>
								<th>密码</th>
								<th>年龄</th>
								<th>性别</th>
								<th>电话</th>
								<th>注册日期</th>
								<th>入职日期</th>
								<th>工资</th>
								<th>角色</th>
								<th>部门</th>
								<th>审核状态</th>								
								<th>审核通过</th>								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${emps}" var="e">
								<tr>
									<td>${e.eId}</td>
									<td>${e.eNum}</td>
									<td>${e.eName}</td>
									<td>${e.epwd}</td>
									<td>${e.age}</td>
									<td>${e.sex}</td>
									<td>${e.phone}</td>
									<td><fmt:formatDate value="${e.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									<td><fmt:formatDate value="${e.hireDate}" pattern="yyyy-MM-dd"/></td>
									<td>${e.sal}</td>
									<td>${e.role.rName}</td>
									<td>${e.dept.dName}</td>
									<td>
									<c:if test="${e.isGo==1}">通过</c:if>
									<c:if test="${e.isGo==0}">不通过</c:if>
									</td>					 
                                    <td>
                                     <input type="button" id="go" value="是" onclick="isGo(${e.eId},this)">
			                         <input type="button" id="notgo" value="否" onclick="notGo(${e.eId},this)">
                                    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<c:url var="stuUrl" value="emp/queryManagers.do">
				</c:url>
				
				<div>
					<a href="${stuUrl}?page=1">首页</a>
					<c:choose>
						<c:when test="${fenYe2.page==1}">
						         上一页
						  </c:when>
						<c:otherwise>
							<a href="${stuUrl}?page=${fenYe2.page-1}">上一页</a>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${fenYe2.page>=fenYe2.totalPage}">
						         下一页
						  </c:when>
						<c:otherwise>
							<a href="${stuUrl}?page=${fenYe2.page+1}">下一页</a>
						</c:otherwise>
					</c:choose>

					<a href="${stuUrl}?page=${fenYe2.totalPage}">尾页</a> 共<span>${fenYe2.totalPage}</span>页
					&nbsp;当前第${fenYe2.page}页
				</div>
			
		
<!-- 底部页脚部分 -->
<div class="footer"></div>
</body>
<script type="text/javascript">
function isGo(eId,obj){
	/* location.href="stu/isGo?eId="+eId; */
	$.ajax({
		url:"emp/isGo.do",
		/* dataType:"json", */
		type:"post",
		data:{"eId":eId,"g":1},
		success:function(data){	
         if(data==0){
        	alert("修改失败") 
         }else{
        	 var tdg = $(obj).parent().parent().find("td")[12];
        	 $(tdg).text("通过");
         }
		}		
	})
}
function notGo(eId,obj){
	alert(eId)
	$.ajax({
		url:"emp/notGo.do",
		/* dataType:"json", */
		type:"post",
		data:{"eId":eId,"g":0},
		success:function(data){	
         if(data==0){
        	alert("修改失败") 
         }else{
        	 var tdg = $(obj).parent().parent().find("td")[12];
        	 $(tdg).text("不通过");
         }
		}		
	})
}
</script>

</html>
