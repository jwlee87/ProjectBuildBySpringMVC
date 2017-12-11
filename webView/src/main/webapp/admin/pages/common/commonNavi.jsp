<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/admin/pages/index.jsp"> 관리자 페이지 </a>
	</div>
	<!-- /.navbar-header -->
	<ul class="nav navbar-top-links navbar-right">
	<!-- 드랍다운 얼럿 시작 -->
	<c:if test="${!empty admin.id}">
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li>
					<a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> New Comment
							<span class="pull-right text-muted small">4 minutes ago</span>
						</div>
					</a>
				</li>
				<li class="divider"></li>
				<li>
					<a class="text-center" href="#">
					<strong>See All Alerts</strong>
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</ul>
			<!-- /.dropdown-alerts -->
		</li>
		<!-- 드랍다운 유저 시작 -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a href="/admin/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			</ul>
		<!-- /.dropdown-user -->
		</li>
	</c:if>
	<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<!-- 사이드바 시작 -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
			<!-- 홈 -->
			<li>
				<a href="index.jsp"><i class="fa fa-home fa-fw"></i> 시작 화면 </a>
			</li>
			<!-- 1:1 문의 -->
			<li>
				<a href="#"><i class="fa fa-comment fa-fw"></i> 1:1 문의 <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li>
						<a href="/admin/pages/askList"> 답변하기 </a>
					</li>
					<li>
						<a href="/admin/pages/answerList"> 답변 완료 </a>
					</li>
				</ul>
			<!-- /.nav-second-level -->
			</li>
			<!-- 인앱 영상관리 -->
			<li>
				<a href="/admin/pages/askList"><i class="fa fa-film fa-fw"></i> 인앱 영상관리 </a>
			</li>
			<!-- 영상 통계 -->
			<li>
				<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 영상 통계 <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li>
						<a href="flot.jsp">Flot Charts</a>
					</li>
					<li>
						<a href="morris.jsp">Morris.js Charts</a>
					</li>
				</ul>
				<!-- /.nav-second-level -->
			</li>
			<li>
				<a href="#"><i class="	fa fa-android"></i>&nbsp;&nbsp;&nbsp;네버다이바카라<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li>
						<a href="#">영상 업로드</a>
					</li>
					<li>
						<a href="/admin/news/list/1">뉴스</a>
					</li>
				</ul>
				<!-- /.nav-second-level -->
			</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	</nav>
</div>
<!-- /#wrapper -->
