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
td{
	font-size: 14px;
	width: 50px;
	height: 30px;
} 

</style>
</head>
<body>
		
			<div class="col-sm-10" id="search">
				<div class="panel panel-default">
					<div class="panel-heading">搜索</div>
					<div class="panel-body">
						<form role="form" class="form-inline" method="post"
							action="stu/findStuByDept.do">
							<div class="form-group">
								<label for="name">姓名</label> <input type="text"
									class="form-control" name="query2.qName"
									value="${fenYe2.query2.qName}">
							</div>
							<div class="form-group">
								<label for="name">班级</label>
								 <select name="query2.cId" class="form-control">
								 <option value="0">-请选择-</option>
								   <c:forEach items="${clas}" var="cla">								   
								   <option value="${cla.cId}" <c:if test="${cla.cId==fenYe2.query2.cId}">selected="selected"</c:if>>${cla.cName}</option>
								   </c:forEach>
								 </select>
							</div>
							<input type="hidden" name="query2.dId" value="${dId}">
							<div class="form-group">
								<button type="submit" class="btn btn-default">开始搜索</button>
							</div>
							<input type="hidden" name="query.eId" value="${eId}" />
						</form>
					</div>
				</div>
			
				<!--
                        列表展示
                    -->
				<div class="table-responsive">
					<table class="table table-striped ">
						<thead>
							<tr>
								<th>ID</th>
								<th>学号</th>
								<th>姓名</th>
								<th>密码</th>
								<th>年龄</th>
								<th>性别</th>
								<th>住址</th>
								<th>电话</th>
								<th>注册日期</th>
								<th>入学日期</th>
								<th>成绩1</th>
								<th>成绩2</th>
								<th>成绩3</th>
								<th>班级</th>
								<th>部门</th>
								<th>审核状态</th>								
								<th>操作</th>								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${stus}" var="stu">
								<tr>
									<td>${stu.eId}</td>
									<td>${stu.eNum}</td>
									<td>${stu.eName}</td>
									<td>${stu.epwd}</td>
									<td>${stu.age}</td>
									<td>${stu.sex}</td>
									<td>${stu.address}</td>
									<td>${stu.phone}</td>
									<td><fmt:formatDate value="${stu.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									<td><fmt:formatDate value="${stu.schoolDate}" pattern="yyyy-MM-dd"/></td>
									<td>${stu.score1}</td>
									<td>${stu.score2}</td>
									<td>${stu.score3}</td>
									<td>${stu.classes.cName}</td>
									<td>${stu.dept.dName}</td>
									<td>
									<c:if test="${stu.isGo==1}">通过</c:if>
									<c:if test="${stu.isGo==0}">不通过</c:if>
									</td>						
            <td><a href="stu/delStu.do?eId=${stu.eId}" class="btn btn-danger">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:url var="stuUrl" value="stu/findStuByDept.do">
					<c:param name="query2.qName" value="${fenYe2.query2.qName}"></c:param>
					<c:param name="query2.cId" value="${fenYe2.query2.cId}"></c:param>
					<c:param name="query2.dId" value="${dId}"></c:param>
				</c:url>

				<div>
					<a href="${stuUrl}&page=1">首页</a>
					<c:choose>
						<c:when test="${fenYe2.page==1}">
						         上一页
						  </c:when>
						<c:otherwise>
							<a href="${stuUrl}&page=${fenYe2.page-1}">上一页</a>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${fenYe2.page>=fenYe2.totalPage}">
						         下一页
						  </c:when>
						<c:otherwise>
							<a href="${stuUrl}&page=${fenYe2.page+1}">下一页</a>
						</c:otherwise>
					</c:choose>

					<a href="${stuUrl}&page=${fenYe2.totalPage}">尾页</a> 共<span>${fenYe2.totalPage}</span>页
					&nbsp;当前第${fenYe2.page}页
				</div>
			</div>
		</div>
		

		<!-- 底部页脚部分 -->
		<div class="footer"></div>
</body>
<script type="text/javascript">
</script>

</html>
