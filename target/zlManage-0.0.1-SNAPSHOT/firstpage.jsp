<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
                    <a class="navbar-brand" href="#">
                        <img src="<%=path %>/images/a.jpg" height="100%" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                       <ul class="nav navbar-nav">
                        <li id="aa" class="active"><a class="icon-bar" href="#">学生信息管理页!</a>
                        </li>
                      </ul> 
                    <ul class="nav navbar-nav navbar-right">
                        <li><a>欢迎您,admin</a>
                        </li>
                        <li><a href="#">安全退出</a>
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
                    <a href="#" class="list-group-item">VIP客户查询</a>
                    <a href="#" class="list-group-item">VIP客户录入</a>
                    <a href="#" class="list-group-item">VIP客户消费</a>
                    <a href="#" class="list-group-item">VIP客户增加</a>
                    <a href="#" class="list-group-item">VIP客户删除</a>
                    <a href="#" class="list-group-item">VIP客户注销</a>
                    <a href="#" class="list-group-item">
                        <span class="glyphicon glyphicon-user" aria-hidden="true">
                    </span>个人设置</a>
                </div>
                <!--左边菜单栏-->
                <div class="col-sm-10">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            搜索
                       </div>
                        <div class="panel-body">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                    <label for="name">名称</label>
                                    <input type="text" class="form-control" id="name" placeholder="学生姓名">
                                </div>
                                <div class="form-group">
                                    <label for="name">状态</label>
                                    <select class="form-control">
                                        <option></option>
                                        <option></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">开始搜索</button>
                                </div>
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
                                    <th>编号</th>
                                    <th>图标</th>
                                    <th>名称</th>
                                    <th>价格</th>
                                    <th>邮费</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>15</td>
                                    <td>
                                        <img src="images/a.jpg" class="img-thumbnail" style="height: 30px;" />
                                    </td>
                                    <td>宝马</td>
                                    <td>1800000.00￥</td>
                                    <td>1800000.00￥</td>
                                    <td>上架</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="" class="btn btn-default">修改</a><a href="" class="btn btn-default">下架</a><a href="" class="btn btn-danger">删除</a>
                                        </div>

                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" style="float: right;">
                        <li><a href="#">«</a>
                        </li>
                        <li class="active"><a href="#">1</a>
                        </li>
                        <li class="disabled"><a href="#">2</a>
                        </li>
                        <li><a href="#">3</a>
                        </li>
                        <li><a href="#">4</a>
                        </li>
                        <li><a href="#">5</a>
                        </li>
                        <li><a href="#">»</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
          <!-- 底部页脚部分 -->
 <div class="footer">
 </div>
    </body>
</html>
