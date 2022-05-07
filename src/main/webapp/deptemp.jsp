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
								<th>操作</th>								
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
  <td><input type="button" class="btn upd" data-toggle="modal" value="修改" data-target="#myModal" onclick="edit(${e.eId},this)"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:url var="stuUrl" value="emp/findEmpDept.do">
					<c:param name="query2.dId" value="${dId}"></c:param>
				</c:url>
                <input type="hidden" id="did" value="${dId}">
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
			
		
		<!-- 弹出层 -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
      </div>
      <div class="modal-body">
       <input type="hidden" id="id"/>
       <div class="form-group">
          <label for="">职员编号</label>
          <input type="text" id="con" class="form-control" placeholder="编号">
       </div>
       <div class="form-group">
          <label for="">入职日期</label>
          <input type="text" id="pho" value="" class="form-control" placeholder="日期">
       </div>
       <div class="form-group">
          <label for="">工资</label>
          <input type="text" id="add" class="form-control" placeholder="工资">
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="sub()">保存</button>
      </div>
    </div>
  </div>
</div>
<!--  -->
		
<!-- 底部页脚部分 -->
<div class="footer"></div>
</body>
<script type="text/javascript">
 function edit(eId,obj){
	$("#id").val(eId);
	
	var tdn = $(obj).parent().parent().find("td")[1];
	var eNum = $(tdn).text();
	$("#con").val(eNum);
	
	var tdh = $(obj).parent().parent().find("td")[8];
	var hireDate = $(tdh).text();
	$("#pho").val(hireDate);
	
	var tds = $(obj).parent().parent().find("td")[9];
	var sal = $(tds).text();
	$("#add").val(sal);
}
 
 function sub(){
	 var eId=$("#id").val();
	 var eNum = $("#con").val();
	 var hireDate =$("#pho").val();
	 var sal = $("#add").val();
	 $.ajax({
			url:"emp/upEmp.do",
			/* dataType:"json", */
			type:"post",
			data:{"eId":eId,"eNum":eNum,"hireDate":hireDate,"sal":sal},
			success:function(data){	
				alert(data)
             if(data==0){
            	alert("修改失败") 
             }else{
            	 var did = $("#did").val();
            	 location.href="emp/findEmpDept.do?query2.dId="+did;
             }
			}		
		})
 }
</script>

</html>
