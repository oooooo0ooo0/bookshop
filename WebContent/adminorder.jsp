<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>adminAllorder</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="Admin_css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="Admin_css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="Admin_css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="Admin_css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet" href="Admin_css/skin-blue.min.css">

<link rel="stylesheet" href="Admin_css/myorder.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="Admin_js/html5shiv.min.js"></script>
  <script src="Admin_js/respond.min.js"></script>
  <script src="Admin_js/jquery.slimscroll.min.js"></script>
  <![endif]-->
<script type="text/javascript">
  	function check(){
  		var flag=0;
  		var id=$("#searchid").val();
  		if(!isNaN(id)){
  			if(id>0){
  				flag=1;
  			}
  		}
  		if(flag==1)
  			return true;
  		else{
  			$("#error_in").text("请输入大于0的数字");
  			return false;
  		}
  	}
  </script>

</head>
		<div class="content-wrapper" style="overflow: auto;">


			<!-- Main content -->
			<section class="content">
			<form action="reachorder" method="post" onsubmit="return check()">
				<div class="input-group col-md-3"
					style="margin-top: 0px positon:relative; margin-left: 30%">
					<input type="text" class="form-control" placeholder="请输入订单号"
						name="orderid" id="searchid" /> <span id="error_in"></span> <span
						class="input-group-btn">
						<button class="btn btn-info btn-search" type="submit">查找</button>
					</span>
				</div>
			</form>
			<!-- Your Page Content Here -->
			<div class="orderdata">
				<div class="persondetaileddate">
					<s:iterator value="#session.allorder" var="my">
						<div class="orders">
							<div>
								订单id:
								<s:property value="#my.orderId" />
							</div>
							<div class="bookd">
								<s:iterator value="#my.bookpicture" var="picture">
									<div style="height: 100px">
										<img src=${picture } width="100px" height="100px">
									</div>
								</s:iterator>
							</div>
							<div class="bookd">
								<s:iterator value="#my.bookname">
									<div style="height: 100px">
										<s:property />
									</div>
								</s:iterator>
							</div>
							<div class="bookd">
								<s:iterator value="#my.booknum">
									<div style="height: 100px">
										<s:property />
										本
									</div>
								</s:iterator>
							</div>
							<div class="bookd">
								<s:iterator value="#my.bookprice">
									<div style="height: 100px">
										￥:
										<s:property />
									</div>
								</s:iterator>
							</div>
							<div>
								<div class="orderaddress">
									收货地址:
									<s:property value="#my.oaddress" />
								</div>
								<div class="ordertotal">
									总价:
									<s:property value="Totalprice" />
								</div>
							</div>
							<div style="margin-left: 5%; margin-top: 2%">
								<div style="float: left;">
									支付状态:
									<s:property value="orderstate" />
								</div>
								<div style="float: left; margin-left: 60%">
									<button type="button" class="btn btn-default"
										onclick="javascript:window.location.href='removeorder.action?orderid='+<s:property value='#my.orderId'/>">
										删除</button>
								</div>
								<s:if test="orderstate == '未支付'">
									<div style="float: left; margin-left: 5%">
										<button type="button" class="btn btn-default"
											onclick="javascript:window.location.href='adminrevisedorder.jsp?orderid='+<s:property value='#my.orderId'/>">
											修改</button>
									</div>
								</s:if>
							</div>
						</div>
					</s:iterator>
				</div>
				<div style="margin-left: 40%">
					<ul class="pagination pagination-lg">
						<s:if test='%{currentPage>1}'>
							<li><a href="adminorder?pageNo=${currentPage-1}">&laquo;</a></li>
						</s:if>
						<c:forEach var="i" begin="1" end="${totalPage}">
							<li><a href="adminorder?pageNo=${i}">${i}</a></li>
						</c:forEach>
						<s:if test="currentPage<totalPage">
							<li><a href="adminorder?pageNo=${currentPage+1}">&raquo;</a></li>
						</s:if>
					</ul>
				</div>
			</div>


			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<!--<footer class="main-footer">
    &lt;!&ndash; To the right &ndash;&gt;
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    &lt;!&ndash; Default to the left &ndash;&gt;
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>-->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark"> <!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab"
				data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;"> <i
							class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;">
							<h4 class="control-sidebar-subheading">
								Custom Template Design <span class="pull-right-container">
									<span class="label label-danger pull-right">70%</span>
								</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
				Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.3 -->
	<script src="js/jquery-3.2.1.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="Admin_js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="Admin_js/app.min.js"></script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
