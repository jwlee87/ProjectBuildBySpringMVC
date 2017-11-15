<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.playground.common.FormatUtil" %>
<%@ page import="kr.co.playground.domain.Member" %>

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
	
	<!-- 메인 시작 -->
	
	<div class="maincon">
	<div class="main">
	
	<div class="mainshort-1">
		<!-- 내정보 섹션 시작 -->
		<section class="section-myInfo">
		
			<!-- 내정보 -->
			<div class="myInfo-table">
			<hr/>
			<h4>내 정보</h4>
			<hr/>
			<form id="myInfoForm" method="POST" enctype="multipart/form-data">
			<table style="text-align: center;" border="0px">
				<tr id="tr-id">
					<td rowspan="5" style="width:15%;">
					<c:if test='${empty sessionScope.login.filePath}'>
						<img id="imgProfile" src="/fileUpload/images.png"
						width="100px" height="100px" />
					</c:if>
					<c:if test='${ !empty sessionScope.login.filePath}'>
					<img id="imgProfile" src="/fileUpload${login.filePath}/${login.systemName}"
						width="100px" height="100px" alt="이미지를 불러올 수 없습니다."/>
					</c:if>
					</td>
					<td style="text-align:right;" width="17%"><b>아이디 : </b></td>
					<td><input type="text" name="id" value="${login.id}" style="width: 170px" disabled/></td>
				</tr>
				<tr id="tr-name">
					<td style="text-align:right;" width="17%"><b>닉네임 : </b></td>
					<td><input id="nickName" type="text" name="nickName" value="${login.nickName}" style="width: 170px" readonly/>
					<input id="nickChange" type="button" value="변경"/>
					<input id="duplCheck" type="button" value="중복체크" style="display:none;"/>
					</td>
				</tr>
				<tr id="tr-email">
					<td style="text-align:right;" width="17%"><b>이메일 : </b></td>
					<td><input type="email" name="email" value="${login.email}" style="width: 170px"/></td>
				</tr>
				<tr id="tr-pass">
					<td style="text-align:right;" width="17%"><b>비밀번호 : </b></td>
					<td><input type="password" id="pass" name="pass" value="${login.pass}" style="width: 170px;"/></td>
				</tr>
				<tr id="tr-pass">
					<td style="text-align:right;" width="17%"><b>비밀번호  확인 : </b></td>
					<td><input type="password" id="passCheck" value="${login.pass}" style="width: 170px;"/></td>
				</tr>
				<tr style="text-align: center;">
					<td id="profile-img"><input id="imgChangeBtn" type="button" value="이미지 변경"/></td>
					<td colspan="2"><a href="!!내정보 변경"><input type="submit" value="내정보 수정"
					style="margin-top: 10px;" /></a></td>
				</tr>
			</table>
			
			
			<input type="file" name="file" id="imgFile" style="display:none;"/>
			<input type="hidden" id="nickCheck" value="success"/>
			<input type="hidden" name="uniqueID" value="${login.uniqueID}"/>
			<input type="hidden" name="id" value="${login.id}"/>
			<input type="hidden" name="webPoint" value="${login.webPoint}"/>
			<input type="hidden" name="levelClass" value="${login.levelClass}"/>
			<input type="hidden" name="condition" value="${login.condition}"/>
			<input type="hidden" name="state" value="${login.state}"/>
			<input type="hidden" name="phone" value="${login.phone}"/>
			<input type="hidden" name="createDate" value="${login.createDate}"/>
			<input type="hidden" name="lastDate" value="${login.lastDate}"/>
			
			
			<input type="hidden" id="msg" name="msg" value="${msg}"/>
			
			</form>
			<hr/>
			</div>
			
			<!-- 현재 계급 <<개발 예정>> -->
			<!-- <div>
			
			<h4>내 등급</h4>
			<hr/>
			<div class="myClass-table">
			<table style="text-align: center;">
				<tr>
					<td style="width: 20%;">현재 등급 표시</td>
					<td style="width: 5%;">현재등급</td>
					<td style="width: 70%;">
					<div id="myProgress">
						<div id="myBar"></div>
					</div>
					<div id="shortfall">
						<p style="margin:0;">다음 진급까지 남은 경험치: 
						<span style="font-weight: bold; color:green;">500EXP</span></p>
					</div>
					</td>
					<td style="width: 5%;">다음등급</td>
				</tr>
			</table>
			</div>
			<hr/>
			</div> -->
			
			<!-- 기타 활동 -->
			<div>
			
			<h4>내 활동</h4>
			<hr/>
			<div class="myActivity-table" style="padding: 10px;">
				<p>● 회원 가입일 : ${login.createDate}</p>
			</div>
			<hr/>
			<div style="text-align: right;">
			<a href="/account/deleteCheck.jsp">회원탈퇴</p></a>
			</div>
			</div>
			
		</section>
		<!-- 스포츠 섹션 종료 -->
		<!-- 우측 어사이드 시작 -->
		<aside class="myInfo-aside">
			<nav><img src="/resources/images/aside/premiumtitle.png" alt="primiemTitle"/>
			<a href="#"><img src="/resources/images/aside/grandview.png"  alt="primiumVideo"></a></nav>
			<nav><img src="/resources/images/aside/teasertitle.png" alt="teaserTitle"/>
			<a href="#"><img src="/resources/images/aside/teaser.png"  alt="teaserVideo"></a></nav>
		</aside>
		<!-- 우측 어사이드 종료 -->
	</div>
	
	</div>
	</div>
	
	<!-- 메인 종료 -->
	
	<jsp:include page="/common/jsp/footer.jsp" />
	
</div>

<script src="/resources/js/index.js"></script>
<script src="/account/js/myInfo.js"></script>

</body>
<!-- 바디 종료 -->
</html>
