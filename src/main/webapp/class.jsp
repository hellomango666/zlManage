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
			<!--左边菜单栏-->
			<div class="col-sm-10" id="search">
				<div class="panel panel-default">
					<div class="panel-heading">搜索</div>
					<div class="panel-body">
						<form role="form" class="form-inline" method="post"
							action="stu/findByClass.do">
							<div class="form-group">
								<label>姓名</label> 
								<input type="text"
									class="form-control" name="query.qName"
									value="${fenYe.query.qName}">
							</div>
							<div class="form-group">
								<label>入学日期</label> 
								<input type="text"
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
									<td>${stu.isGo}</td>
			           <td><input type="button" class="btn upd" data-toggle="modal" value="修改" data-target="#myModal" onclick="edit(${stu.eId},this)"></td>
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
		<!-- 弹出层开始 -->
		<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
      </div>
      <div class="modal-body">
       <input type="text" id="id"/>
       <div class="form-group">
          <label>学员编号</label>
          <input type="hidden" class="form-control" id="con"/>
       </div>
       <div class="form-group">
           <label>入学日期</label>
           <input type="text" class="form-control" id="add"/>
       </div>
       <div class="form-group">
           <label>第一次考试成绩</label>
           <input type="text" class="form-control" id="s1"/>
       </div>
        <div class="form-group">
           <label>第二次考试成绩</label>
           <input type="text" class="form-control" id="s2"/>
       </div>
        <div class="form-group">
           <label>第三次考试成绩</label>
           <input type="text" class="form-control" id="s3"/>
       </div>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="sub()">保存</button>
      </div>
    </div>
  </div>
</div>
		<!-- 弹出层结束 -->

		<!-- 底部页脚部分 -->
		<div class="footer"></div>
</body>
<script type="text/javascript">
function isGo(eId){
	location.href="stu/isGo?eId="+eId;
}

function edit(eId,obj){
	$("#id").val(eId);
	
	var tdn = $(obj).parent().parent().find("td")[1];
	var eNum = $(tdn).text();
	$("#con").val(eNum);

	var tds = $(obj).parent().parent().find("td")[9];
	var schoolDate = $(tds).text();
	$("#add").val(schoolDate);
	
	var tdh = $(obj).parent().parent().find("td")[10];
	var score1 = $(tdh).text();
	$("#s1").val(score1);
	
	var tdh2 = $(obj).parent().parent().find("td")[11];
	var score2 = $(tdh2).text();
	$("#s2").val(score2);
	
	var tdh3 = $(obj).parent().parent().find("td")[12];
	var score3 = $(tdh3).text();
	$("#s3").val(score3);
	
}
 
 function sub(){
	 var eId=$("#id").val();
	 var eNum = $("#con").val();
	 var schoolDate = $("#add").val();
	 var score1 = $("#s1").val();
	 var score2 = $("#s2").val();
	 var score3 = $("#s3").val();
	 $.ajax({
			url:"stu/upScore.do",
			/* dataType:"json", */
			type:"post",
			data:{"eId":eId,"eNum":eNum,"schoolDate":schoolDate,"score1":score1,"score2":score2,"score3":score3},
			success:function(data){	
             if(data==0){
            	alert("修改失败") 
             }else{
            	 location.href="stu/findByClass.do?query.eId="+$("#userid").val();
             }
			}		
		})
 }
</script>

</html>
