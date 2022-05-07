<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
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
 	<style type="text/css">
 	  #right{
         position:absolute;
		 top:8%;
		 left:16%;
		 width:80%;
		 height:92%;
		 border: 2px solid black;
	}
 	</style>
  </head>
 <body>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                       <ul class="nav navbar-nav">
                        <li id="aa" class="active"><a class="icon-bar" href="#">学生信息管理页!</a>
                        </li>
                      </ul> 
                    <ul class="nav navbar-nav navbar-right"><li>

                        <li><a>欢迎您,${sessionScope.loginUser.eName}</a>
                        </li>
                        <li><a href="http://localhost:8080/zlManage/login.jsp">安全退出</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


       <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2">
                    <a href="#" class="list-group-item active"><span class="glyphicon glyphicon-home"></span>学生管理
                    </a>
                     <c:forEach items="${loginUser.role.powers}" var="power"> 
                        <c:if test="${power.pId==21}">
                         <a target="rightt" href="${power.url}?eId=${loginUser.eId}&rId=${loginUser.role.rId}" class="list-group-item">${power.pName}</a>    
                        </c:if> 
                        
                        <c:if test="${power.pId==22}" >
                        <a target="rightt" href="${power.url}" class="list-group-item">${power.pName}</a>
                        </c:if>
                        
                        <c:if test="${power.pId==23}" >
                        <a target="rightt" href="${power.url}?query.eId=${loginUser.eId}" class="list-group-item">${power.pName}</a>
                        </c:if>
                       
                       <c:if test="${power.pId==24}" >
                        <a target="rightt" href="${power.url}?query2.dId=${loginUser.dept.dId}" class="list-group-item">${power.pName}</a>
                       </c:if>
                       
                       <c:if test="${power.pId==26}" >
                        <a target="rightt" href="${power.url}?query2.dId=${loginUser.dept.dId}" class="list-group-item">${power.pName}</a>
                       </c:if>
                       
                       <c:if test="${power.pId==25}" >
                           <c:if test="${loginUser.role.rId==101}">
                            <a target="rightt" href="stu/findByClass2.do?query.eId=${loginUser.eId}" class="list-group-item">${power.pName}</a>
                           </c:if>
                           <c:if test="${loginUser.role.rId==102}">
                            <a target="rightt" href="emp/findEmpDept2.do?query2.dId=${loginUser.dept.dId}" class="list-group-item">${power.pName}</a>
                           </c:if>       
                      </c:if>
                      
                      <c:if test="${power.pId==27}" >
                        <a target="rightt" href="${power.url}" class="list-group-item">${power.pName}</a>
                       </c:if>
                      
                     </c:forEach>
                    
                    <!--stu/findStuById.do?eId=${loginUser.eId}&rId=${loginUser.role.rId}
                        23  stu/findByClass.do?query.eId=${loginUser.eId}
                        24  emp/findEmpDept.do?query2.dId=${loginUser.dept.dId}
                        26  stu/findStuByDept.do?query2.dId=${loginUser.dept.dId}
                    -->
               </div>
            </div>
          </div>
          <div id="right">
            <iframe name="rightt" width="100%" height="100%">
            </iframe>
          </div>            
 <div class="footer">
 </div>
    </body>
<script type="text/javascript">
</script>  
</html>

