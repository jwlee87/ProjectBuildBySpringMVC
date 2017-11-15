<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>어른들의 놀이터 - 어.이.터</title>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/resources/js/jquery.cookie.js" ></script>

<style>
body, html { font-size: 100%; 	padding: 0; margin: 0; background:#ffffff; height:100%;}
input  {border-color:#e4e4e4;}
#login {background:url("/resources/images/loginbackground.png"); height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover;}
#logincon {width:942px; height: 100%; margin:0 auto; background-position: center; background-repeat: no-repeat; background-size: cover; background:#ffffff; border-left:1px solid #000000; border-right:1px solid #000000;}
#loginform {width:100%; height:auto; float:left; position:relative; margin-top:150px;}
.logintable {width:283px; height:auto; margin:0 auto; border-collapse:collapse;}
.logintable td {border-collapse:collapse; text-align:center;  font-family:"Nanum Gothic", sans-serif; font-size:14px; }
.logintable td p {font-family:"Nanum Gothic", sans-serif; font-size:14px; color:#4a4945; font-weight:bold;}
.logintable td a {font-family:"Nanum Gothic", sans-serif; font-size:13px; color:#838383; text-align:center;}
.inputbox {width:283px; padding:10px; background:#ededed;  -webkit-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1);-moz-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); border:none; border-radius: 5px;} 
.checkbox { position: relative; right: 3px; top: 2px; background:#ededed;  -webkit-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1);-moz-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); border:none; border-radius: 5px;}  
</style>
</head>
<body id="login">
	
	
	<div id="logincon">
	<div id="loginform">
	<img src="/resources/images/loginformlogo.png" alt="logo" style="margin-left:3px;"/>
	
	<!-- 폼 시작 -->
	<form action="/login/register" method="post" name="registerform" class="loginform">
		
		<table class="logintable">
		<tr>
			<td><span id="duplId" style="float:left; position:absolute; left:135px; top:225px; width:auto; bottom:0px; display:none; color:#FF4509;">&nbsp;
				<b>아이디</b>가 이미 존재합니다.&nbsp;</span>
			<p style="text-align:left;">아이디를 입력하세요.</p>
			<input type="text" id="id" name="id" class="inputbox" required>
			</td>
		</tr>
		<tr>
			<td><span id="duplNick" style="float:left; position:absolute; left:135px; top:310px; width:auto; bottom:0px; display:none; color:#FF4509;">&nbsp;
				<b>닉네임</b>이 이미 존재합니다.&nbsp;</span>
			<p style="text-align:left;">닉네임을 입력하세요.</p>
			<input id="nickName" type="text" name="nickName" class="inputbox" required>
			</td>
		</tr>
		<tr>
			<td><span id="capslock" style="float:left; position:absolute; left:115px; top:394px; width:auto; bottom:0px; display:none; color:#42a5be;">&nbsp;
				<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</span>
				<p style="text-align:left;">비밀번호를 입력하세요.</p>
				<input id="pass" type="password" name="pass" class="inputbox"
					onkeypress="caps_lock(event)" required>
			</td>
		</tr>
			<td><span id="pswIncrt" style="float:left; position:absolute; left:105px; top:474px; width:auto; bottom:0px; display:none; color:#FF4509;">&nbsp;
				<b>비밀번호</b>가 일치하지 않습니다.&nbsp;</span>
			<p style="text-align:left;">비밀번호 확인.</p>
				<input id="passCheck" type="password" name="passCheck" class="inputbox"
					onkeypress="caps_lock(event)" required>
			</td>
		<tr>
			<td><span id="emailIncrt" style="float:left; position:absolute; left:104px; top:558px; width:auto; bottom:0px; display:none; color:#FF4509;">&nbsp;
				이미 존재하는 <b>메일주소</b> 입니다.&nbsp;</span>
			<p style="text-align:left;">이메일 주소를 입력하세요.</p>
				<input id="email" type="email" name="email" class="inputbox" required>
			</td>
		</tr>
		<tr>
			<td><img id="nextBtn" src="/resources/images/registerbtn.png" name="Submit" style="margin-top:20px;"><br/></td>
		</tr>
		<tr>
			<td style="padding-top:40px;"><a href="javascript:location.href='/index.jsp'" style="color:#58595a;">돌아가기</a></td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="" value="" />
			</td>
		</tr>
		</table>
		</form>
	</div><!--end loginform-->
	</div><!--end logincon-->
	
	
	<input id="msg" type="hidden" value="${request.msg }"/>
	<input type="hidden" id="idDuplCheck" value="false"/>
	<input type="hidden" id="nickDuplCheck" value="false"/>
	<input type="hidden" id="passCrt" value="false"/>
	<input type="hidden" id="emailDuplCheck" value="false"/>
	
<script type="text/javascript">

function caps_lock(e) {
	var keyCode = 0;
	var shiftKey = false;
	keyCode = e.keyCode;
	shiftKey = e.shiftKey;
if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
	|| ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
	show_caps_lock();
	setTimeout("hide_caps_lock()", 10000);
}else {
	hide_caps_lock();
}
}
function show_caps_lock() {
$("#capslock").show();
}
function hide_caps_lock() {
$("#capslock").hide();
}

$(document).ready(function(){
	
	
	var userInputId = $.cookie("userInputId");
	$("input[name='id']").val(userInputId);
	
	if($("input[name='id']").val() != ""){
		$("#idSaveCheck").attr("checked", true);
	}
	
	$("#idSaveCheck").change(function(){
		if($("#idSaveCheck").is(":checked")){
			var userInputId = $("input[name='id']").val();
			$.cookie("userInputId", userInputId, {expires: 15});
		}else{
			$.removeCookie("userInputId");
		}
	});
	
	$("input[name='id']").keyup(function(){
		if($("#idSaveCheck").is(":checked")){
			var userInputId = $("input[name='id']").val();
			$.cookie("userInputId", userInputId, {expires: 15});
		}
	});
	
	if( $("msg").val() != null ){
		alert( $("msg").val() );
	}

});


/* 닉네임 중복 체크 */
function nickDuplCheck(){
	if( $("#nickDuplCheck").val() == "false" ){
		$.ajax({
			type: "POST"
			, url: "/login/duplCheck"
			, data: {param:'nickname', value:$("#nickName").val()}
			, dataType: "text"
			, success: function(value, data){
				if( value == "success") {
					//alert("닉네임 성공");
					$("#nickDuplCheck").val("success");
					$("#duplNick").hide();
				} else {
					//alert("닉네임 실패");
					$("#nickDuplCheck").val("false");
					$("#duplNick").show();
				}
				passCheck();
				//emailDupleCheck();
				formConditionCheck();
				
			}
			, error: function(){
				alert(" NickName 중복체크 중 오류발생. 잠시후 다시 시도해 주세요.");
				$("#nickDuplCheck").val("false");
			}
		})
	} else {
		passCheck();
		//emailDupleCheck();
		formConditionCheck();
	}
}

/* 이메일 주소 체크 */
function emailDupleCheck(){
	if( $("#emailDuplCheck").val() == "false" ){
		$.ajax({
			type: "POST"
			, url: "/login/duplCheck"
			, data: {param: 'email', value:$("#email").val()}
			, dataType: "text"
			, success: function(value, data){
				if( value == "success") {
					//alert("이메일 성공");
					$("#emailDuplCheck").val("success");
					$("#emailIncrt").hide();
				} else {
					//alert("이메일 실패");
					$("#emailDuplCheck").val("false");
					$("#emailIncrt").show();
				}
				formConditionCheck();
			}
			, error: function(){
				alert(" email 중복체크 중 오류발생. 잠시후 다시 시도해 주세요.");
				$("#emailDuplCheck").val("false");
			}
		})
	} else {
		formConditionCheck();
	}
}

/* 비밀번호 체크 */
 function passCheck(){
	if( $("#passCrt").val() == "false" ){
		if( $("#pass").val() != $("#passCheck").val() ){
			$("#pswIncrt").show();
			$("#passCrt").val("false");
			//alert("비밀번호 실패");
		} else {
			$("#pswIncrt").hide();
			$("#passCrt").val("success");
			//alert("비밀번호 성공");
		}
	}
}

/* 폼 날리는 조건 체크 */
function formConditionCheck(){
	if( $("#idDuplCheck").val() == "success" &&
			$("#passCrt").val() == "success" &&
			$("#nickDuplCheck").val() == "success" ){
		//alert("회원가입 success");
		$("form[name=registerform]").submit();
	} else {
		alert("회원가입 안됨 - 조건 실패");
	}

}

/* 폼 전송 	*/
$("#nextBtn").on("click", function(){
	
	var id = $("#id").val();
	var pass = $("#pass").val();
	var passCheck = $("#passcheck").val();
	var nick = $("#nickName").val();
	var email = $("#email").val();
	
	/* 아이디 중복 체크 */
	if( $("#idDuplCheck").val() == "false" ){
		$.ajax({
			type: "POST"
			, url: "/login/duplCheck"
			, data: {param:'id', value:id}
			, dataType: "text"
			, success: function(value, data){
				if( value == "success") {
					//alert("아이디 성공");
					$("#idDuplCheck").val("success");
					$("#duplId").hide();
				} else {
					//alert("아이디 중복");
					$("#idDuplCheck").val("false");
					$("#duplId").show();
				}
			nickDuplCheck();
			}
			, error: function(){
				alert(" ID 중복체크 중 오류발생. 잠시후 다시 시도해 주세요.");
				$("#idDuplCheck").val("false");
			}
		})
	//아이디 성공인데 버튼 눌린 경우
	} else {
		nickDuplCheck();
	}
	
})

</script>
</body>
</html>