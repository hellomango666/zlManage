<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width,initial-scale=1">
       <title>Document</title>
      <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
      <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  
     <style>
          body{
              background-color: #C7EDCC;
              font-family: "microsoft yahei";
             /*min-width: 800px;*/
          }
          img{
              width: 100%;
              /*height: 462px;*/
          }
          .navbar{
              /*margin-bottom: -10px;*/
          }
          #myppt{
              margin-top: -20px;
          }
          #ds{
          margin-left:17px;
          }
      </style>
  </head>
  <body>
      <ul class="nav navbar-nav navbar-right">
          <li><a data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>
        <li><a data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
      </ul>
      <!-- 注册窗口 -->
      <div id="register" class="modal fade" tabindex="-1">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-body">
                      <button class="close" data-dismiss="modal">
                          <span>&times;</span>
                     </button>
                 </div>
                 <div class="modal-title">
                      <h1 class="text-center">注册</h1>
                </div>
                  <div class="modal-body">
                              <div class="form-group">
                                  <label for="">姓名</label>
                                  <input id="us" class="form-control" type="text" placeholder="3-5个汉字">
                                  <span style="color:red" id="userTip"></span>
                             </div>
                              <div class="form-group">
                                  <label for="">密码</label>
                                  <input id="pwd" class="form-control" type="password" placeholder="同时包含数字和字母且在8-16位之间">
                                  <span style="color:red"  id="pwdTip"></span>
                             </div>
                             <div class="form-group">
                                  <label for="">再次输入密码</label>
                                  <input id="pwd2" class="form-control" type="password" placeholder="同时包含数字和字母且在8-16位之间"> 
                                  <span style="color:red" id="pwdTip2"></span>
                             </div>
                             <div id="d1" class="form-group">
                                  <label for="">角色&nbsp;</label>
                                  <select id="choice" onchange="javascript:choice()" required="required">
                                    <option value="2" selected="selected" >-请选择-</option>
                                    <option value="0" >学生</option>
                                    <option value="1" >职员</option>
                                  </select>
                                 
                                 <select id="dt" name="rId">
                                  <option value="2" selected="selected" >-请选择-</option>                           
                                 </select>
                                 
                                 <select id="ds" name="cId">
                                   <option value="2" selected="selected" >-请选择-</option>                         
                                </select>                                
                             </div>
                           
                             <div class="form-group">
                                  <label for="">所在部门</label>
                                  <select name="dId" id="dd" required="required">
                                     <option value="1">java部</option> 
	                                 <option value="2">测试部</option> 
	                                 <option value="3">就业部</option>	                                                             
                                  </select>                                 
                             </div>
                             
                             <div class="form-group">
                              <label for="">注册日期</label>
                              <input id="regDate" readonly class="form-control" type="text" placeholder="2019-09-10">
                             </div>
                             
                             
                              <div class="text-right">
                                <input id="submit" class="btn btn-primary" type="button" value="提交"/>
                                  <button class="btn btn-danger" data-dismiss="modal">取消</button>
                             </div>
                              <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                 </div>
              </div>
          </div>
      </div>
     <!-- 登录窗口 -->
     <div id="login" class="modal fade">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-body">
                      <button class="close" data-dismiss="modal">
                          <span>&times;</span>
                    </button>
                  </div>
                  <div class="modal-title">
                      <h1 class="text-center">登录</h1>
                  </div>
                 <div class="modal-body">
                      <form class="form-group" action="">
                              <div class="form-group">
                                 <label for="">用户名</label>
                                  <input id="logu" class="form-control" type="text" placeholder="">
                              </div>
                             <div class="form-group">
                                  <label for="">密码</label>
                                 <input id="logp" class="form-control" type="password" placeholder="">
                              </div>
                              
                              <div class="form-group">
                                  <label for="">角色</label>
                                  <select id="logr" required>
                                    <option value="0">学生</option>
                                    <option value="1">职员</option>
                                  </select>
                              </div>
                  
                              <p><span id="ss" style="color:red"></span><p>
                              
                             <div class="text-right">
                                  <input id="submit2" class="btn btn-primary" type="button" value="登录"/>
                                  <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>
                             <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                   </form>
                 </div>
             </div>
         </div>
     </div>
 </body>
<script type="text/javascript">
var userState = false;
var pwdState = false;
var pwdState2 = false;

$(function(){
	$("#ds").hide();
	$("#dt").hide();	
	 //正则表达式验证输入的合法性
	 $("#us").blur(function(){		
		 var username = $("#us").val();
		 var pwd = $("#pwd").val();
		 var pwd = $("#pwd").val();
		 var reg = /^[\u4e00-\u9fa5]{3,5}$/;
		 if(reg.test(username)==false){
			 $("#userTip").html("姓名必须是3~5个汉字");
		 }else{
			 $("#userTip").html("");
			 userState = true;
			 //判断用户名是否可用
			 $.ajax({
				  method: "POST",
				  url: "reg/doReg.do",
				  data: {"name":username}
				 }).done(function(data) {
				   if(data==1){
					   $("#userTip").html("用户名被占用");
					   userState = true;
				   } 
			});	 
		 }
	 }); 
	 
	 $("#pwd").blur(function(){
		 var pwd = $("#pwd").val();
		 var reg = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,12}$/;
		 if(reg.test(pwd)==true){
			 pwdState = true;
			 $("#pwdTip").html("");
		 }else{
			 $("#pwdTip").html("密码不可用");
			 pwdState = false;
		 }
	 });
	 
	 $("#pwd2").blur(function(){
		 var pwd = $("#pwd").val();
		 var pwd2 = $("#pwd2").val();
		 if(pwd==pwd2){
			 $("#pwdTip2").html("");
			 pwdState2 = true;
		 }else{
			 $("#pwdTip2").html("密码不一致");
		 }
	 });
	 
	$("#submit").click(function(){
		var username = $("#us").val();
		var pwd = $("#pwd").val();
		var dId = $("#dd").val();
		var cho = $("#choice").val();
		if(userState==true && pwdState==true && pwdState2==true){
			if(cho==0){
				var cId=$("#ds").val();
				$.ajax({
					  method: "POST",
					  url: "reg/regstu.do",
					  data: {"eName":username,"epwd":pwd,"cId":cId,"dId":dId}
					 }).done(function(msg) {
					   if(msg==1){
						 alert("注册成功"); 
						 var now = new Date();
						 var time=now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
						 $("#regDate").val(time);
					   }else{
						   alert("注册失败");
					} 			
			})
		}else if(cho==1){
			var rId=$("#dt").val();
			$.ajax({
				  method: "POST",
				  url: "reg/regemp.do",
				  data: {"eName":username,"epwd":pwd,"rId":rId,"dId":dId}
				 }).done(function(msg) {
				   if(msg==1){
					 alert("注册成功"); 
					 var now = new Date();
					 var time=now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
					 $("#regDate").val(time);
				   }else{
					   alert("注册失败");
				} 						
		 })
	}
  }			
})
/* 得到班级 */
$.getJSON("reg/findClass.do",function(data){
	var arr = data.cla;
	var str ="";
	for(var i=0;i<arr.length;i++){
		str+="<option value='"+arr[i].cId+"'>"+arr[i].cName+"</option>";
	}
	$("#ds").html(str);
});
/* 得到职员角色 */
 $.getJSON("reg/findRoles.do",function(data){
	 var arr = data.list;
	 var str ="";
	 for(var i=0;i<arr.length;i++){
		str+="<option value='"+arr[i].rId+"'>"+arr[i].rName+"</option>";
	 }
	 $("#dt").html(str);
 });
 
 /*登陆 */
 $("#submit2").click(function(){
	var logu = $("#logu").val();
	var logp = $("#logp").val();
	var logr = $("#logr").val();
	if(logr==0){
		$.ajax({
			url:"reg/stulog.do",
			dataType:"json",
			type:"post",
			data:{"eName":logu,"epwd":logp},
			success:function(data){
				alert(data)
				if(data==0){
					alert("用户名或密码输入错误");
				}else if(data==2){
					alert("审核未通过，无法登陆");
				}else if(data==1){
					alert(data)
					alert("登陆成功")
					location.href="firstpage.jsp";
				}
			}		
		})	 
	}else if(logr==1){
		$.ajax({
			url:"reg/emplog.do",
			dataType:"json",
			type:"post",
			data:{"eName":logu,"epwd":logp},
			success:function(data){			
				if(data==0){
					alert(data)
					alert("用户名或密码输入错误");
				}else if(data==2){
					alert("审核未通过，无法登陆");
				}else if(data==1){
					alert("登陆成功")
					location.href="firstpage.jsp";
				}
			}		
		})	 
	}
	
 });

	
})

function choice(){
	var cho = $("#choice").val();
	if(cho==0){
		$("#dt").hide();
		$("#ds").show();
	}else if(cho==1){
		$("#dt").show();
		$("#ds").hide();
	}
}
</script>
 </html>
 
 



