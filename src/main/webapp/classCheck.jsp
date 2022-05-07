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
	width: 40px;
	height: 30px; //
	border: 1px solid black;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li id="aa" class="active"><a class="icon-bar" href="#">学生信息管理页!</a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
				<li><a>欢迎您,${sessionScope.loginUser.eName}</a></li>
				<li><a href="#">安全退出</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
				<a href="#" class="list-group-item active"><span
					class="glyphicon glyphicon-home"></span>学生管理 </a>
				<c:forEach items="${loginUser.role.powers}" var="power">
					<a href="stu/findByClass.do?eId=${loginUser.eId}"
						class="list-group-item">${power.pName}</a>
				</c:forEach>
				<a href="#" class="list-group-item"> <span
					class="glyphicon glyphicon-user" aria-hidden="true"> </span>个人设置
				</a>
			</div>
			<%-- <!--左边菜单栏-->
			<div class="col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">搜索</div>
					<div class="panel-body">
						<form role="form" class="form-inline" method="post"
							action="stu/findByClass.do">
							<div class="form-group">
								<label for="name">姓名</label> <input type="text"
									class="form-control" name="query.qName"
									value="${fenYe.query.qName}">
							</div>
							<div class="form-group">
								<label for="name">入学日期</label> <input type="text"
									name="query.qsDate" class="Wdate" onclick="WdatePicker()"
									readonly="readonly"
									value="<fmt:formatDate value='${fenYe.query.qsDate}' pattern='yyyy-MM-dd'/>" />
								<input type="text" name="query.qeDate" class="Wdate"
									onclick="WdatePicker()" readonly="readonly"
									value="<fmt:formatDate value='${fenYe.query.qeDate}' pattern='yyyy-MM-dd'/>" />
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-default">开始搜索</button>
							</div>
							<input type="hidden" name="query.eId" value="${eId}" />
						</form>
					</div>
				</div>
				<!-- --%>
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
									<td>${stu.regDate}</td>
									<td>${stu.schoolDate}</td>
									<td>${stu.score1}</td>
									<td>${stu.score2}</td>
									<td>${stu.score3}</td>
									<td>${stu.classes.cName}</td>
									<td>${stu.dept.dName}</td>
									<td>${stu.isGo}</td>
           <td><a href="stu/findStuById.do?eId=${stu.eId}" class="btn btn-danger">审核</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:url var="stuUrl" value="stu/findByClass.do">
					<c:param name="query.qName" value="${fenYe.query.qName}"></c:param>
					<c:param name="query.qsDate">
						<fmt:formatDate value="${fenYe.query.qsDate}" pattern="yyyy-MM-dd" />
					</c:param>
					<c:param name="query.qeDate">
						<fmt:formatDate value="${fenYe.query.qeDate}" pattern="yyyy-MM-dd" />
					</c:param>
					<c:param name="query.eId" value="${eId}"></c:param>
				</c:url>

				<div>
					<a href="${stuUrl}&page=1">首页</a>
					<c:choose>
						<c:when test="${fenYe.page==1}">
						         上一页
						  </c:when>
						<c:otherwise>
							<a href="${stuUrl}&page=${fenYe.page-1}">上一页</a>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${fenYe.page>=fenYe.totalPage}">
						         下一页
						  </c:when>
						<c:otherwise>
							<a href="${stuUrl}&page=${fenYe.page+1}">下一页</a>
						</c:otherwise>
					</c:choose>

					<a href="${stuUrl}&page=${fenYe.totalPage}">尾页</a> 共<span>${fenYe.totalPage}</span>页
					&nbsp;当前第${fenYe.page}页
				</div>
			</div>
		</div>
		

		<!-- 底部页脚部分 -->
		<div class="footer"></div>
</body>


</html>
