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
	width: 45px;
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
								<th>审核通过</th>
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
			                        <td>
			                         <input type="button" id="go" value="是" onclick="isGo(${stu.eId},this)">
			                         <input type="button" id="notgo" value="否" onclick="notGo(${stu.eId},this)">
			                        </td>                      
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:url var="stuUrl" value="stu/findByClass2.do">
					<c:param name="query.eId" value="${eId}"></c:param>
				</c:url>
				<input type="hidden" id="userid" value="${loginUser.eId}"/>
				
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
<script type="text/javascript">
function isGo(eId,obj){
	alert(eId)
	/* location.href="stu/isGo?eId="+eId; */
	$.ajax({
		url:"stu/isGo.do",
		/* dataType:"json", */
		type:"post",
		data:{"eId":eId,"g":1},
		success:function(data){	
         if(data==0){
        	alert("修改失败") 
         }else{
        	 alert("审核成功")
        	 var tdg = $(obj).parent().parent().find("td")[15];
        	 $(tdg).text("通过");
         }
		}		
	})
}
function notGo(eId,obj){
	alert(eId)
	$.ajax({
		url:"stu/notGo.do",
		/* dataType:"json", */
		type:"post",
		data:{"eId":eId,"g":0},
		success:function(data){	
         if(data==0){
        	alert("修改失败") 
         }else{
        	 alert("审核成功")
        	 var tdg = $(obj).parent().parent().find("td")[15];
        	 $(tdg).text("不通过");
         }
		}		
	})
}
</script>

</html>
