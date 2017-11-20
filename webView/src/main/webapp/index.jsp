<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "kr.co.kingofday.domain.Member" %>
<%@ page import="kr.co.kingofday.common.FormatUtil" %>

<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>어른들의 놀이터 - 어.이.터</title>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<link rel="stylesheet" href="/resources/css/common.css"/>

</head>

<!-- 바디 시작 -->
<body>
<div class="con">	

	<jsp:include page="/common/jsp/header.jsp" />
	<jsp:include page="/common/jsp/topBanner.jsp" />
	
	<!-- 메인 시작 -->
	<div class="maincon">
	<div class="main">
	<!-- 메인숏-1 시작: 스포츠섹션+어사이드 -->
	<div class="mainshort-1">
		<!-- 스포츠 섹션 시작 -->
		<section class="section-sport">
			<div class="sport-title"><h3>스포츠</h3><a href="#"><span>더보기▶</span></a></div>
			<div class="sport-table">
			<table>
				<tr><td class="sport-td-1" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="sport-td-1-img"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
				</td></tr>
				<tr><td class="soprt-small-td 1"><a href="#"><img src="/resources/images/blancimg.png" alt="sport-td-2-img"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p></td>
					<td class="soprt-small-td 2"><a href="#"><img src="/resources/images/blancimg.png" alt="sport-td-2-img"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3><p>내용이 들어갑니다.</p></td></tr>
				<tr><td class="soprt-small-td 1"><a href="#"><img src="/resources/images/blancimg.png" alt="sport-td-2-img"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3><p>내용이 들어갑니다.</p></td>
					<td class="soprt-small-td 2"><a href="#"><img src="/resources/images/blancimg.png" alt="sport-td-2-img"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3><p>내용이 들어갑니다.</p></td></tr>
			</table>
			</div>
		</section>
		<!-- 스포츠 섹션 종료 -->
		<!-- 우측 어사이드 시작 -->
		<aside>
			<nav><img src="/resources/images/aside/premiumtitle.png" alt="primiemTitle"/>
			<a href="#"><img src="/resources/images/aside/grandview.png"  alt="primiumVideo"></a></nav>
			<nav><img src="/resources/images/aside/teasertitle.png" alt="teaserTitle"/>
			<a href="#"><img src="/resources/images/aside/teaser.png"  alt="teaserVideo"></a></nav>
		</aside>
		<!-- 우측 어사이드 종료 -->
	</div>
	<!-- 메인숏-1 종료: 스포츠섹션+어사이드 -->
	<!-- 메인숏-2 시작: 미니게임+최신글 -->
	<div class="mainshort-2">
		<!-- 미니게임 섹션 시작 -->
		<section class="section-minigame">
		<div class="minigame-con">
		<div class="minigame-title"><h3>미니게임</h3><a href="#"><span>더보기▶</span></a></div>
		<div class="minigame-table">
			<table>
				<tr><td class="minigame-td 1" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="minigame-td-1-img" style="height: 99px; float:left; margin: auto 15px auto 5px;"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
				</td></tr>
				<tr><td class="minigame-td 2" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="minigame-td-1-img" style="height: 99px; float:left; margin: auto 15px auto 5px;"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
				</td></tr>
				<tr><td class="minigame-td 3" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="minigame-td-1-img" style="height: 99px; float:left; margin: auto 15px auto 5px;"></a>
					<h3><a href="#"></a></h3>
					<p></p>
				</td></tr>
			</table>
			</div>
		</div>
		</section>
		<!-- 미니게임 섹션 종료 -->
		<!-- 최신글 섹션 시작 -->
		<section class="section-new">
		<div class="new-con">
		<div class="new-title"><h3>최신글</h3><a href="#"><span>더보기▶</span></a></div>
		<div class="new-table">
			<table>
				<tr><td class="new-td 1" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="new-td-1-img" style="height: 99px; float:left; margin: 0px 15px 0px 5px;"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
				</td></tr>
				<tr><td class="new-td 2" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="new-td-2-img" style="height: 99px; float:left; margin: 0px 15px 0px 5px;"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
				</td></tr>
				<tr><td class="new-td 3" colspan="2">
					<a href="#"><img src="/resources/images/blancimg.png" alt="new-td-3-img" style="height: 99px; float:left; margin: 0px 15px 0px 5px;"></a>
					<h3><a href="#">제목이 들어갑니다.</a></h3>
					<p>내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.</p>
				</td></tr>
			</table>
		</div>
		</div>
		</section>
		<!-- 최신글 섹션 종료 -->
	</div>
	<!-- 메인숏-2 종료: 미니게임+최신글 -->
	<!-- 메인숏-3 시작: 하단배너 2개 -->
	<div class="mainshort-3">
		<nav class="bottom-banner">
			<div class="bottom-banner-1"><a href="#">
			<img src="/resources/images/banner/bottom-banner-1.png" alt="bottom-banner-1"/>
			</a></div>
			<div class="bottom-banner-2"><a href="#">
			<img src="/resources/images/banner/bottom-banner-2.png" alt="bottom-banner-2"/>
			</a></div>
		</nav>
	</div>
	<!-- 메인숏-3 종료: 하단배너 2개 -->
	</div>
	</div>
	<!-- 메인 종료 -->
	
	<jsp:include page="/common/jsp/footer.jsp" />	
</div>

<script src="/resources/js/index.js"></script>

</body>
<!-- 바디 종료 -->
</html>
