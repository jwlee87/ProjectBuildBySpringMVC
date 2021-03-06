<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<title>이용약관</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>

/* 4inch smartphone (landscape) 568X320 */
@media only screen
and (max-device-width : 568px)
and (min-device-width : 400px) {
	.container-fluid {width: 558px; height: 310px; background-image: url("/webView/img/568x320/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 45px;}
	#tosBtn {height: 20px; margin: 15px auto;}
	#privacyBtn {height: 20px; margin: 15px auto;}
	#tos {height: 80%; display: block; margin: 0 0 0 5px;}
	#privacy {display: none; height: 80%; margin: 0 0 0 5px;}
	p {}
}

/* **standard** */
/* Samsung Galaxy S7, g2 (landscape) 640X360 */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 569px) {
	.container-fluid {width: 630px; height: 350px; background-image: url("/webView/img/640x360/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 55px;}
	#tosBtn {height: 25px; margin: 20px 0 0 -10px;}
	#privacyBtn {height: 25px; margin: 20px 0 0 10px;}
	#tos {height: 80%; display: block; margin: 0 0 0 5px;}
	#privacy {display: none; height: 80%; margin: 0 0 0 5px;}
	p {font-size: 12px; padding: 5px;}
}

/* Samsung Galaxy S8 (landscape) 740X360 */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 730px; height: 350px; background-image: url("/webView/img/740x360/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 55px;}
	#tosBtn {height: 25px; margin: 16px auto;}
	#privacyBtn {height: 25px; margin: 16px auto;}
	#tos {height: 80%; display: block; margin: 0 0 0 5px;}
	#privacy {display: none; height: 80%; margin: 0 0 0 5px;}
	p {font-size: 14px; padding: 5px;}
}

/* LG G3 (landscape) 853X480 */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 843px; height: 470px; background-image: url("/webView/img/853x480/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 65px;}
	#tosBtn {height: 25px; margin: 25px auto;}
	#privacyBtn {height: 25px; margin: 25px auto;}
	#tos {height: 85%; display: block; margin: 0 0 0 7px; padding: 5px;}
	#privacy {display: none; height: 85%; margin: 0 0 0 7px; padding: 5px;}
	p {font-size: 14px; padding: 5px;}
}

/* Samsung Galaxy Note4 (landscape) 960X540 */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 950px; height: 530px; background-image: url("/webView/img/960x540/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 65px;}
	#tosBtn {height: 25px; margin: 35px auto;}
	#privacyBtn {height: 25px; margin: 35px auto;}
	#tos {height: 85%; display: block; margin: 7px 0 0 7px; padding: 5px;}
	#privacy {display: none; height: 85%; margin: 7px 0 0 7px; padding: 5px;}
	p {font-size: 16px; padding: 5px;}
}

/* Tablet iPad (landscape) 1024X768 */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px) {
	.container-fluid {width: 1014px; height: 758px; background-image: url("/webView/img/1024x768/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 65px;}
	#tosBtn {height: 25px; margin: 40px auto;}
	#privacyBtn {height: 25px; margin: 40px auto;}
	#tos {height: 89%; display: block; margin: 15px 0 0 7px; padding: 5px;}
	#privacy {display: none; height: 89%; margin: 15px 0 0 7px; padding: 5px;}
	p {font-size: 18px; padding: 5px;}
}

/* Tablet Tab10, Xperia Z4 (landscape) 1280X800 */
@media only screen
and (max-device-width : 2560px)
and (min-device-width : 1025px) {
	.container-fluid {width: 1270px; height: 790px; background-image: url("/webView/img/1280x800/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#topcon {height: 110px;}
	#tosBtn {height: 35px; margin: 45px auto;}
	#privacyBtn {height: 35px; margin: 45px auto;}
	#tos {height: 85%; display: block; margin: 0 0 0 7px; padding: 5px;}
	#privacy {display: none; height: 85%; margin: 0 0 0 7px; padding: 5px;}
	p {font-size: 20px; padding: 5px;}
}

.contentcon {height: 100%; width: 100%; overflow-y: hidden; overflow-x: hidden}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>

</head>
<body style="height: 100%; width: 100%; background-color: black;">

<div class="container-fluid">


	<div class="contentcon" style="height: 100%;">
		<div id="topcon" class="row">
			<div class="col-6" style="margin: 0 auto;">
				<div class="row">
					<div class="col-2"></div>
					<img class="col-8" id="tosBtn" src="/webView/img/common/tos/kr/tos_btn.png""/>
					<div class="col-2"></div>
				</div>
			</div>
			<div class="col-6" style="margin: 0 auto;">
				<div class="row">
					<div class="col-2"></div>
					<img class="col-8" id="privacyBtn" src="/webView/img/common/tos/kr/privacy_btn.png""/>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
		<div class="row" id="tos" style="width: 100%;">
			<div class="col-12" style="padding: 0 2% 0 2%; height: 98%;">
			<p style="height: 100%; margin: 5px auto; color: white; overflow-y: scroll">

	<br/>
	&nbsp;&nbsp;&nbsp;제1조 [목적]<br/><br/>

 이 약관은 ㈜ King of Day (이하 ‘회사’)가 제공하는 모바일게임 서비스 이용과 관련하여 회사와 이용자
간의 권리와 의무 및 필요한 제반 사항을 규정함을 그 목적으로 합니다.<br/><br/><br/><br/>


	&nbsp;&nbsp;&nbsp;제2조 [용어의 정의]<br/><br/>
 
 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br/><br/>
 
 1. “이용자”란 회사의 약관에 동의하고 회사의 정보를 지속적으로 제공받으며 회사가 제공하는 서비스를 지속
적으로 이용할 수 있는 자를 의미하고, “임시이용자”란 정식으로 “이용자”로 가입하지 아니하고 게스트로그인 
모드를 이용하는 자를 의미합니다.<br/><br/>
 2. “서비스”란 회사가 제공하는 모바일게임 및 기타 서비스 일체를 의미합니다.<br/><br/>
 3. “단말기”란 서비스를 다운로드 받거나 설치하여 사용할 수 있는 휴대폰, 스마트폰, PDA, 태블릿,
휴대용 게임기, 콘솔 게임기 등의 기기를 의미합니다.<br/><br/>
 4. "애플리케이션"이란 회사가 제공하는 서비스를 이용하기 위하여 제2조 제3항에서 설명한 단말기를 통해
다운로드 받거나 설치하여 사용하는 프로그램 일체를 의미합니다.<br/><br/>
 5. "오픈마켓사업자"란 당사 게임을 설치하고 결제할 수 있도록 기능을 제공하는 전자상거래 업체(게임 
내 결제를 제공하는 사업자 포함)를 의미합니다.(예: 구글 플레이 앱스토어, 애플 앱스토어, 티스토어,
올레마켓, 유플러스 앱마켓 등)<br/><br/>
 6. "플랫폼사업자"란 당사 게임을 알리거나 이용함에 있어서 회사와 제휴하여 서비스를 제공하는 사업자를
의미합니다. (예, 카카오, 라인 등)<br/><br/>
 7. "계정정보"란 이용자의 ID, 게임 회원번호, 기기정보, 별명, 프로필 사진, 친구목록 등 이용자
가 회사에 제공한 일반정보 및 게임이용정보(캐릭터 정보, 아이템, 레벨 등), 이용요금 결제정보 등의
 생성정보를 의미합니다.<br/><br/>
 8. "유료콘텐츠"란 이용자가 서비스를 이용함에 있어 특정한 효과 또는 효능을 향유하기 위하여 오픈마켓
사업자를 통해 구매하는 온라인 콘텐츠 일체를 의미합니다.<br/><br/>
 9. "무료콘텐츠"란 제2조 제8항의 유료콘텐츠를 구매하지 아니하고 이용자 간 선물이나 게임 서비스를
이용하면서 취득할 수 있는 온라인 콘텐츠 일체를 의미합니다.<br/><br/>
 10. "In-App결제(In-App Purchase)"란 애플리케이션 내에서 아이템, 게임머니 등의 유료
콘텐츠 등을 구매하기 위한 결제행위를 의미합니다.<br/><br/>
 11. 이 약관에서 사용하는 용어의 정의는 제2조에서 정하는 것을 제외하고는 관계법령 및 기타 일반적인
상관례에 의합니다.<br/><br/><br/><br/>


	&nbsp;&nbsp;&nbsp;제3조 [약관의 효력과 변경]<br/><br/>


 1. 이 약관은 회사의 웹사이트 또는 서비스 이용을 위한 애플리케이션 내에 명시하고, 이용자가 애플리케이션
을 설치 및 실행하여 동의란에 체크함으로써 효력이 발생하게 됩니다.<br/><br/>
 2. 이 약관에 동의하는 것은 정기적으로 해당 약관의 변경사항을 확인하는 것에 동의하는 것을 의미합니다.
 3. 회사는 관련 법령의 변경이나 이용자의 권리 및 의무사항을 개선하기 위해 관계 법령 또는 상관습에 위배
하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/><br/>
 4. 변경된 약관은 변경된 약관 적용일 7일 전에(다만, 이용자의 권리?의무에 중대한 영향을 미치는 사항에 
대하여는 30일전) 회사의 웹사이트나 공식 카페, 제공하는 애플리케이션등을 통해 이용자에게 고지하고 적용
일부터 효력이 발생합니다.<br/><br/>
 5. 이용자는 변경된 약관에 대해 동의하지 않을 권리가 있으며, 변경된 약관에 동의하지 않을 경우에는 애플
리케이션 로그아웃 및 삭제와 함께 서비스 이용을 중단하고 탈퇴할 수 있습니다. 다만, 회사가 변경된 약관을 
고지하면서 이용자에게 적용일 전까지 거부의 의사표시를 하지 않으면 약관 변경에 동의한 것으로 간주한다는 뜻
을 명확히 하였음에도 불구하고 이용자가 거부의 의사표시를 하지 아니하는 경우에는 변경된 약관에 동의한 것으
로 간주합니다. <br/><br/><br/><br/>


	&nbsp;&nbsp;&nbsp;제4조 [약관 외 준칙]<br/><br/>


 이 약관에서 명시하지 아니한 사항에 대해서는 회사의 운영정책, 관계 법령 및 상관례에 의합니다.<br/><br/><br/><br/>


	&nbsp;&nbsp;&nbsp;제5조 [회사의 의무]<br/><br/>


 1. 회사는 관련 법령과 이 약관에서 금지하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 
 위하여 최선을 다하여 노력합니다.<br/><br/>
 2. 회사는 이용자의 개인정보보호를 위한 보안의무를 게을리하지 않습니다. 단, 서비스의 특성에 따라 이용자의 
 별명, 사진 등 자신을 소개하는 내용이 이용자의 선택에 의해 다른 이용자에게 공개될 수 있습니다.<br/><br/>
 3. 회사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 합리적인 기간 내에 
 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 통보하여야 합니다.<br/><br/>
 4. 회사는 계속적이고 안정적인 서비스의 제공을 위하여 서비스 개선을 하던 중 설비에 장애가 생기거나 데이터 
 등이 멸시된 때에는 천재지변, 비상사태, 해결이 곤란한 기술적 결함 등 부득이한 사유가 없는 한 이를 수리 또는
 복구하도록 최선의 노력을 다합니다.<br/><br/>
 5. 회사는 개인정보보호를 위해 개인정보취급방침을 고지하고 준수합니다.<br/><br/>


	&nbsp;&nbsp;&nbsp;제6조 [이용자의 의무]<br/><br/><br/><br/>
	
 이용자는 회사에서 제공하는 서비스를 게임 서비스 본래의 이용목적 이외의 용도로 사용하거나 다음 각 항에 해당하는
 행위를 해서는 안됩니다. 또한, 이용자는 이용약관의 수정사항을 수시로 확인하여야 합니다.<br/><br/>
 
 1. 고객 문의, 유료콘텐츠 복구 및 환불요청, 이벤트 당첨 등으로 인해 회사에 개인정보 제공 시 실명이 아닌 
 정보 또는 다른 사람의 정보를 사용하거나, 허위 사실을 기재하는 행위<br/><br/>
 2. 타인으로 가장하거나 타인과의 관계를 허위로 명시하는 행위, 다른 이용자의 ID 및 비밀번호를 도용, 부정
 하게 사용하거나, 타인의 신용카드, 유/무선전화, 은행 계좌 등을 무단으로 도용하여 유료콘텐츠를 구매
 하는 행위<br/><br/>
 3. 회사가 제공하지 않는 서비스를 통해 유료콘텐츠 등을 타인과 거래하거나 매매하는 행위<br/><br/>
 4. 회사의 서비스 및 제공된 애플리케이션을 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제, 유통, 상업적
 이용 또는 알려지거나 알려지지 않은 버그를 악용하여 서비스를 이용하는 행위<br/><br/>
 5. 회사의 서비스 및 제공된 애플리케이션을 이용하여 자기 또는 타인에게 재산상의 이익을 발생시키는 행위<br/><br/>
 6. 회사나 제3자의 지적재산권 등 기타 권리를 침해하거나 다른 이용자의 개인정보를 수집, 저장, 유포, 게시,
 이용하는 행위<br/><br/>
 7. 제3자를 기망하여 이득을 취하거나 회사가 제공하는 서비스를 불건전하게 이용하거나 하여, 제3자에게 피해를 
 주는 행위<br/><br/>
 8. 회사로부터 특별한 권리를 부여 받지 않고 애플리케이션을 변경하거나 애플리케이션에 다른 프로그램을 추가 또는
 삽입하거나 서버를 해킹, 역설계하거나 소스코드나 애플리케이션 데이터의 유출 및 변경, 별도의 서버를 구축
 하거나 웹사이트의 일부분을 임의로 변경 또는 도용하여 회사를 사칭하는 행위<br/><br/>
 9. 회사의 직원이나 운영자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 메일을 
 발송하는 행위<br/><br/>
 10. 회사의 사전 동의 없이 광고성 정보를 전송하는 행위<br/><br/>
 11. 기타 공공질서 및 미풍양속을 위반하거나 불법적, 부당한 행위 및 관계 법령에 위배되는 행위<br/><br/><br/><br/>

	
	&nbsp;&nbsp;&nbsp;제7조 [서비스 이용 시간]<br/><br/>


 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 
 운영을원칙으로 합니다. 단, 정기점검 등의 필요에 의해 회사가 정한 날이나 시간에는 서비스를 
 일시 중단할 수 있으며 회사는 그 시간대나 날짜를 미리 웹사이트나 애플리케이션 내에 공지합니다.<br/><br/><br/><br/>
	
	
	&nbsp;&nbsp;&nbsp;제8조 [서비스 내용 및 변경]<br/><br/>


 1. 회사는 새로운 게임 내용, 각종 버그 패치 등 서비스의 운영상, 기술상 또는 기획상 필요한 경우,
 제공하고 있는 서비스의 전부 또는 일부를 상시적으로 수정, 추가, 폐지 등 변경할 수 있습니다. 변경될 
 서비스의 내용 및 제공일자 등에 대해서는 운영하는 웹사이트 또는 애플리케이션 내에 게시하여 통지합니다. 
 2. 회사는 서비스의 운영상, 기술상, 또는 기획상 서비스를 일시 중단 또는 종료할 필요가 있는 경우 
 다음 각호와 같이 서비스를 일시 중단 또는 종료할 수 있습니다.<br/>

 ① 30일전 고지 후 일시 중단하는 경우<br/><br/>
 가. 기간제 유료아이템 : 일시 중단 기간만큼 기간 연장 단, 이용자의 취소/환불 요청이 있을 시 잔여기간에 
 해당하는 금액에 대해서만 환불.<br/><br/>
 나. 비기간제 유료아이템 또는 무료 아이템 : 일시 중단 후 계속적 사용가능하며, 취소환불 불가.<br/>
 ② 30일전 고지 후 서비스 종료하는 경우<br/><br/>
 
 정보제공 및 제2항의 광고 등을 제공하는 경우 SMS(LMS), 스마트폰 알림(Push 알림), 메일주소 등을 활용하여 발송
 할 수 있으며, 이용자가 원하지 않는 경우에는 언제든지 수신을 거부할 수 있습니다<br/><br/><br/><br/>
 

	&nbsp;&nbsp;&nbsp;제10조 [유료콘텐츠의 구매 및 이용]<br/><br/>


 1. 이용자는 서비스를 사용하고 있는 단말기의 종류에 따른 각 오픈마켓사업자의 결제 운영정책에 따라 
 유료콘텐츠를 구매 할 수 있으며, 해당 결제 정책의 차이로 인해 결제금액 한도액의 차이가 발생할 수 
 있습니다. 또한 유료콘텐츠의 구매대금은 오픈마켓사업자와 연계된 이동통신사나 플랫폼사업자 또는 
 오픈마켓사업자가 정하는 방법 및 정책에 따라 부과되며, 납부방식 역시 해당 사업자의 정책을 따릅니다.<br/><br/>
 2. 게임 서비스 내에서 이용자가 구매한 유료콘텐츠는 해당 게임 서비스 애플리케이션을 다운로드 받거나 
 설치한 단말기에서만 이용할 수 있습니다.<br/><br/><br/><br/>
 
 
 
	&nbsp;&nbsp;&nbsp;제11조 [In-App 결제]<br/><br/>
 
 
 1. 회사의 애플리케이션은 유료콘텐츠 구매를 위한 In-App결제 기능을 포함하고 있습니다.<br/><br/>
 2. 이용자는 단말기의 비밀번호 설정 기능, 오픈마켓에서 제공하는 비밀번호 설정 기능 등을 이용하여 제3자의 
 In-App결제를 방지하여야 하며, 회사는 이를 위하여 방송통신위원회의 권고 및 「오픈마켓모바일콘텐츠 
 결제가이드라인」에 따라 오픈마켓이 제공하는 인증절차 등이 적용된 In-App결제를 위한 모듈, 라이브러리 
 등을 애플리케이션에 적용합니다.<br/><br/>
 3. 이용자가 단말기 및 오픈마켓의 비밀번호 설정 기능 등을 이용하지 않거나 부주의하게 노출하여 발생하는 제3자의 
 	In-App결제에 대하여는 회사가 어떠한 책임도 부담하지 않습니다.<br/><br/>
 4. 이용자가 이동통신사의 청소년 요금제에 가입한 경우, 해당 단말기에서 In-App결제를 하면 그 내용은 
 법정대리인의 동의가 있는 것으로 간주합니다. <br/><br/>
 5. 이용자는 오픈마켓사업자의 정책, 방법 등에 따라 In-App결제 대금을 성실히 납부하여야 할 책임이 있으며 
 각 결제 수단별로 결제 한도가 부여될 수 있습니다.<br/><br/><br/><br/>
 
 
	&nbsp;&nbsp;&nbsp;제12조 [청약철회 및 환불 등]<br/><br/>
 
 
 1. 이용자가 구매한 유료콘텐츠의 경우에는 계약체결일 또는 유료콘텐츠 이용가능일로부터 7일 
 이내에 별도의 수수료 없이 청약철회(구매취소)를 할 수 있습니다. 단, 선물 및 이벤트 등 
 회사나 제3자로부터 무상으로 제공받은 유료콘텐츠 또는 청약철회 요청 당시 이미 사용하였거나 
 사용한 것으로 간주되는 유료콘텐츠 등 이에 준하는 특성을 가진 일부 유료 콘텐츠에 대하여는 
 「전자상거래등에서의소비자보호에관한법률」 제17조 제2항 제2호 내지 제3호 및 「콘텐츠산업진흥법」 
 제27조 제1항에 따라 청약철회(구매취소)가 제한될 수 있습니다. 이 경우 회사는 이용자에 대하여 
 해당 유료콘텐츠 구매 시 고지하는 등 관련 법률에서 정한 바에 따른 조치를 취하기로 합니다.<br/><br/>
 2. 이용자가 회사의 고의 또는 중대한 과실에 따른 귀책사유로 인하여 구매한 유료콘텐츠를 이용하지
 못하는 경우, 동일한 유료콘텐츠를 무상으로 제공하거나 해당 구매 금액을 계약체결일(구매일)에 
 관계없이 전액 환불합니다. 다만 서비스를 중단하는 경우에는 제8조 제2항에 의하여 처리합니다.<br/><br/>
 3. 환불은 납부 확인이 된 경우에 한해 신청일로부터 3영업일 이내 구매한 결제수단으로 환불함을 
 원칙으로 합니다. 단, 서비스를 사용하고 있는 단말기의 운영체제 종류에 따라 각 오픈마켓사업자의
 환불 운영정책이 적용될 수 있으며, 자세한 환불 신청 절차는 회사 웹사이트 또는 애플리케이션 
 내에 공지된 바에 따릅니다. 또한 환불이 된 대가에 따라 게임 내 유료 콘텐츠는 해당 환불된 금액
 만큼 차감 반영합니다.<br/><br/>
 4. 유료콘텐츠를 개봉(예: 보관함에서 이동시킨 경우 등)하거나 사용하기 버튼을 클릭한 경우
 에는 이용자가 사용 의사를 밝힌 것으로 판단할 수 있으며, 또한 전체 혹은 일부 사용으로 인하여 
 게임 서비스 내에서 구매 할 수 있는 기본 단위가 훼손되었을 시에도 회사는 이용자가 사용 의사를 
 밝힌 것으로 판단합니다. 또한 메시지함 및 선물함 등 유료콘텐츠의 송수신과 관련된 	화면에서 
 수락 등의 동의 과정을 거친 경우 이는 이용자가 사용 의사를 밝힌 것으로 판단합니다. 해당 사항
 은 고객의 의도와 상이하게 타인을 통해 구매되었을 경우도 포함합니다.<br/><br/>
 5. 이용자가 실제 정상적인 구매내역이 기록되는 이용대금의 결제를 통하지 않고 게임 서비스 중에 
 보상으로 취득하거나, 회사가 내부 이벤트 혹은 외부 제휴 이벤트 등을 통하여 지급한 콘텐츠는 
 환불되지 않습니다.<br/><br/>
 6. 청약철회 및 환불 등을 요구할 경우에는 회사 고객센터 또는 회사가 지정한 위탁업체에 별도의 
 개인정보 취급에 대한 동의 과정을 거친 후 회사의 구매내역 확인에의해 진행되며, 이 과정 중
 플랫폼사업자, 오픈마켓 사업자를 통해 구매내역을 확인하는 절차를 거친 다음 진행됩니다. 
 회사는 이 과정 중에서 이용자의 정당한 청약철회 사유를 확인하기 위해 이용자에게서 제공받은 
 정보를 통해 이용자에게 연락하여 정확한 사실 확인을 할 수 있으며, 추가적으로 증빙을 요구할 
 수 있습니다.(예: 플랫폼사업자에 등록된 개인정보, 오픈마켓사업자의 구매 또는 결제내역,
 고객의 의도와 상이하게 타인을 통해 구매되었다는 것을 확인할 수 있는 서류 &lt;예: 가족관계
 증명서&gt; 등)<br/><br/>
 7. 다음과 같은 경우 유료콘텐츠의 청약철회가 제한되며 회사는 청약철회가 제한되는 유료콘텐츠에 
 대해서 In-App결제 전에 청약철회가 제한됨을 표시합니다.
 ① 구매 후 즉시 사용이 시작되거나 즉시 애플리케이션에 적용되는 유료콘텐츠의 경우
 ② 추가적인 혜택이 제공되는 유료콘텐츠에서 해당 추가 혜택이 사용된 경우
 ③ 묶음형으로 판매된 유료콘텐츠의 일부가 사용된 경우
 ④ 개봉행위를 사용으로 볼 수 있거나 개봉 시 효용이 결정되는 캡슐형/확률형 유료콘텐츠의 경우<br/><br/>
 8. 애플리케이션에서 판매되는 유료콘텐츠를 미성년자가 법정대리인의 동의 없이 In-App결제한 
 경우, 미성년자 또는 법정대리인은 In-App결제를 취소할 수 있습니다. 단, 미성년자의 
 In-App결제가 법정대리인으로부터 처분을 허락 받은 재산의 범위 내인 경우 또는 미성년자가 
 사술 등을 사용하여 성년자로 믿게 한 때에는 취소가 제한됩니다. 유료콘텐츠의 구매자가 미성
 년자인지 여부는 In-App결제가 진행된 단말기 또는 신용카드 등 결제수단의 명의자를 기준으로 
 판단됩니다. 결제취소를 요청하시는 경우 회사의 필요에 따라 미성년자 및 법정대리인을 증명할 
 수 있는 서류를 제출하여야 합니다.<br/><br/>
 9. 선물하기 기능을 통하여 이루어진 In-App결제에 대하여는 구매한 유료콘텐츠에 하자가 있는 경우
 를 제외하고는 원칙적으로 결제취소 및 환급이 불가하며, 유료콘텐츠의 하자로 인한 환급은 선물을
 보낸 이용자에 한하여 가능합니다.<br/><br/>
 10. 애플리케이션 다운로드 또는 네트워크 서비스를 이용하여 발생되는 요금(예: 통화료, 데이터 통화료 등)
 은 환불 대상에서 제외될 수 있습니다.<br/><br/><br/><br/>
 
 
	&nbsp;&nbsp;&nbsp;제13조 [과오금의 환불]<br/><br/>
 
 
 
 1. 회사의 귀책사유로 과오금이 발생한 경우 과오금을 이용자에게 환불합니다. 단, 이용자의 귀책사유로 과오금이 
 발생한 경우에는 회사가 과오금을 환불하는 데 소요되는 비용을 합리적인 범위 내에서 이용자에게 부담하도록 
 할 수 있습니다.<br/><br/> 
 2. 환불절차는 오픈마켓사업자가 제공하는 방식을 따릅니다. 따라서 과오금이 발생한 경우, 이용자는 원칙적으로 
 오픈마켓사업자에 대하여 환급을 요청하거나, 추가 결제를 하여야 합니다. 단, 회사는 오픈마켓사업자의 정책, 
 시스템에 따라 가능한 경우 회사가 오픈마켓사업자를 대신하여 위와 같은 절차를 대행할 수도 있습니다<br/><br/><br/><br/>
 
 
 
	&nbsp;&nbsp;&nbsp;제14조 [계약 해지 및 서비스 이용 중지 등]<br/><br/>
 
 
 1. 이용자는 언제든지 서비스 이용을 원하지 않는 경우, 회원탈퇴를 통해 계약을 해지할 수 있습니다. 탈퇴는 즉시 
 처리되며 탈퇴 시 이용자가 보유한 콘텐츠 정보는 모두 삭제되어 복구가 불가능합니다. <br/><br/>
 2. 회사는 이용자가 다음 각 호의 사유에 해당하는 행위를 한 경우, 이용계약을 해지하거나 또는 기간을 정하여 서비스 
 이용을 중지할 수 있습니다.<br/><br/>
 ① 서비스 신청 시에 허위 내용을 등록한 경우 <br/>
 ② 서비스 운영을 고의로 방해한 경우<br/>
 ③ 타인의 서비스 아이디 및 비밀번호를 도용한 경우 <br/>
 ④ 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우<br/>
 ⑤ 회사 및 이용자에게 피해를 유발시키는 바이러스 프로그램 등을 유포하는 경우<br/>
 ⑥ 기타 제6조 이용자의 주요 의무 항목을 위배하여 회사의 서비스에 지장을 초래하는 모든 경우<br/><br/>
 3. 전항의 규정에 따라 이용계약을 해지하거나 중단하는 경우 이용자는 다운로드 받은 콘텐츠를 사용할 수 없으며,
 기 지급한 콘텐츠 구매 대금 및 데이터 통화료, 월정액 서비스 이용료 등을 반환 받을 수 없습니다.<br/><br/><br/><br/>
 
 
	&nbsp;&nbsp;&nbsp;제15조 [손해배상]<br/><br/>
 
 
 1. 회사는 회사가 제공하는 무료 서비스 이용과 관련하여 회사의 고의나 중과실에 의해 이용자에게 발생한 손해에
 대해서만 그 손해를 배상합니다.<br/><br/>
 2. 회사가 제3자와 제휴 계약을 맺고 이용자에게 개별서비스를 제공함에 있어 이용자가 제3자의 이용약관에 동의를 
 한 뒤 개별서비스 제공자의 귀책 사유로 인해 손해가 발생할 경우 관련 손해에 대해서는 제3자가 책임을 집니다.<br/><br/>
 3. 이용자가 서비스를 이용함에 있어 행한 불법행위나 이 약관 위반행위로 인하여 회사가 당 이용자 이외에 제3자
 로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받는 경우, 당 이용자는 자신의 책임과 비용으로 
 회사를 면책시켜야 하며, 회사가 면책되지 못하는 경우 당 이용자는 그로 인해 회사에 발생한 모든 	손해를 배상할 
 	책임이 있습니다.<br/><br/><br/><br/>
 
 
	&nbsp;&nbsp;&nbsp;제16조 [면책]<br/><br/>
 
 
 1. 회사는 전시, 사변, 천재지변, 국가비상사태, 해결이 곤란한 기술적 결함 기타 불가항력적 사유로 서비스를 
 제공할 수 없는 경우에는 책임이 면제됩니다.<br/><br/>
 2. 회사는 이용자의 귀책사유로 인한 서비스의 중지/이용장애에 대하여 책임을 지지 아니하며, 회사는 기간 통신 
 사업자 등이 전기통신서비스 등을 중지하거나 정상적으로 제공하지 아니하여 이용자에게 손해가 발생한 경우에 
 대해서는 책임이 면제됩니다.<br/><br/>
 3. 회사는 사전에 공지되거나 긴급하게 실시된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 
 서비스가 중지되거나 장애가 발생한 경우에 대해서 회사의 고의 또는 중대한 과실이 없는 한 책임이 면제됩니다.<br/><br/>
 4. 회사는 이용자가 서비스를 이용하여 기대하는 점수, 순위 등을 얻지 못한 것에 대하여 책임을 지지 않으며 서비스에 
 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 회사의 고의 또는 중대한 과실이 없는 한 책임이 면제됩니다.<br/><br/>
 5. 회사는 무료로 제공되는 서비스 이용과 관련하여 회사의 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.<br/><br/>
 6. 회사는 이용자의 게임상 경험치, 등급, 아이템, 게임상 머니 등의 손실에 대하여 회사의 고의 또는 중대한 과실로 
 인한 경우를 제외하고 책임을 지지 않습니다.<br/><br/>
 7. 회사는 이용자가 본인의 개인정보 등(계정정보 포함)을 변경하여 얻는 불이익 및 정보상실에 대해서 회사의 고의 
 또는 중대한 과실이 없는 한 일체 책임을 지지 않습니다.<br/><br/>
 8. 회사는 이용자의 단말기 환경으로 인하여 발생하는 제반 문제 또는 회사의 귀책사유가 없는 네트워크 환경으로 
 인하여 발생하는 문제에 대해서 책임을 지지 않습니다.<br/><br/>
 9. 회사는 이용자 상호간 또는 이용자와 제3자 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며 
 이로 인한 손해를 배상할 책임도 없습니다.<br/><br/>
 10. 회사는 관련 법령, 정부 정책 등에 따라 게임서비스 또는 회원에 따라 게임 서비스 이용시간 등을 제한할 수 
 있으며, 이러한 제한사항 및 제한에 따라 발생하는 게임 서비스 이용 관련 제반사항에 대해서는 책임이 면제 됩니다.<br/><br/>
 11. 회사는 ”임시이용자”가 정식으로 “이용자”로 가입하지 아니하고 회사의 서비스를 이용함에 따라 발생될 
 수 있는 모든 문제에 대하여 책임을 지지 아니합니다. “임시이용자”로 서비스를 이용하는 경우 다음 각호의 
 사유가 발생시 서비스 이용기록 및 거래기록이 삭제되거나 기록을 확인할 수 없는 문제가 발생할 수 있습니다. 
 따라서, “회사”는 이러한 사실에 대해 최초 서비스 이용 시 팝업 등으로 알려드릴 것입니다. 또한, 제3자가 
 “임시이용자”의 단말기 정보를 부정하게 조작, 이용하여 서비스를 이용함에 따른 결과에 대하여도 회사는 책임을 
 지지 않습니다. <br/><br/>

	&nbsp;&nbsp;1. 모바일 기기를 변경한 경우<br/>
	&nbsp;&nbsp;2. 모바일 기기를 개조하거나 초기화한 경우<br/>
	&nbsp;&nbsp;3. 모바일 기기에서 어플리케이션 등 콘텐츠를 삭제한 경우<br/><br/><br/><br/>
 
 
	&nbsp;&nbsp;&nbsp;제17조 [테스트 목적 게임서비스에 대한 특례]<br/><br/>
 
 
 1. 회사는 새로운 게임 서비스를 정식으로 상용화하기 전에 이용자들을 대상으로 일정 기간 테스트 목적의 
 	게임 서비스(이하 “CBT”라 합니다)를 제공할 수 있습니다.<br/><br/>
 2. CBT는 해당 게임 서비스의 안정성 등을 위해 게임 데이터의 변경, 추가, 삭제 등이 실시될 수 있으며,
 	 이와 관련하여 복구, 이용시간 연장, 손해배상 등 일체의 보상은 진행되지 아니합니다.또한 CBT 
 	 기간 동안 이용자가 취득한 아이템, 게임머니, 캐릭터 등은 기간 종료 후 초기화됩니다.<br/><br/>
 3. CBT 진행 중 예상치 못한 문제가 발생할 경우에는 회사는 사전 통지 없이 CBT를 중단할 수 있습니다.<br/><br/>
 4. CBT 기간은 회사의 웹사이트 또는 애플리케이션을 통해 공지합니다.<br/><br/>
 5. 이 약관의 전반적인 내용과 본 조항의 내용이 해석상 상호 충돌하는 경우에는 본 조항의 내용을 우선하여 적용합니다.<br/><br/><br/><br/>
 
 
	&nbsp;&nbsp;&nbsp;제18조 [재판권 및 준거법]<br/><br/>
 
 
 1. 이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 해당 규정에 따릅니다.<br/><br/>
 2. 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 법령에 정한 절차에 따른 법원을 관할 법원으로 합니다.<br/><br/>
 3. 회사와 이용자간에 제기된 소송에는 대한민국법을 적용합니다.<br/><br/><br/>
 
 
 &lt;부칙&gt;<br/><br/>
 
 본 약관은 2017년 11월 10일부터 시행됩니다.<br/><br/><br/><br/>
			
			</p>
			</div>
		</div>
			
		<div id="privacy" class="row" style="width: 100%;">
			<div class="col-12" style="padding: 0 2% 0 2%; height: 95%;">
			<p style="height: 100%; margin: 10px auto; color: white; overflow-y: scroll;">

<br/>
 1. 개인정보의 처리 목적 (‘http://www.kingofday.co.kr/’이하 ‘KingofDay’) 은(는) 다음의 목적을
 	위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.<br/><br/>
 - 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 
 	따른 금액 결제, 물품 또는 서비스의 공급.배송 등<br/><br/><br/><br/>



 2. 개인정보의 처리 및 보유 기간<br/><br/>

 ① (‘http://www.kingofday.co.kr/’이하 ‘KingofDay’) 은(는) 정보주체로부터 개인정보를 수집할 
 때 동의 받은 개인정보 보유,이용기간 또는 법령에 따른 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.<br/><br/>
 ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br/><br/>
 ☞ 아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.<br/><br/>
(예시)-고객 가입 및 관리: 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권,채무관계 잔존시에는 해당 채권,채무관계 
정산시까지<br/><br/>
 - 전자상거래에서의 계약,청약철회, 대금결제, 재화 등 공급기록 : 5년<br/><br/><br/><br/>



 3. 개인정보의 제3자 제공<br/><br/>

 (‘http://www.kingofday.co.kr/’이하 ‘KingofDay) 은(는) 정보주체의 별도 동의, 법률의 특별한 규정 등 
 개인정보 보호법 제17조에 해당하는 경우 외에는 개인정보를 제3자에게 제공하지 않습니다.<br/><br/><br/><br/>



 4. 개인정보처리 위탁<br/><br/>

 ① ('KingofDay')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br/><br/>

 - 위탁받는 자 (수탁자) : (주)킹오브데이<br/>
 - 위탁하는 업무의 내용 : 구매 및 요금 결제, 본인인증(금융거래, 금융서비스), 회원제 서비스 이용에 따른 본인확인, 
 	불만처리 등 민원처리, 이벤트 및 광고성 정보 제공 및 참여기회 제공<br/>
 - 위탁기간 : 1년<br/><br/>


 ② ('http://www.kingofday.co.kr/'이하 'KingofDay')은(는) 위탁계약 체결시 개인정보 
 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적,관리적 보호조치, 재위탁 제한, 수탁자
 에 대한 관리,감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 
 처리하는지를 감독하고 있습니다.<br/><br/><br/><br/>



 4. 개인정보처리 위탁<br/><br/>

 ① ('KingofDay')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br/><br/><br/><br/>


 5. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.<br/><br/>

 ① 정보주체는 (‘사이트URL’이하 ‘사이트명) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할
 수 있습니다.<br/><br/>
 1. 개인정보 열람요구<br/>
 2. 오류 등이 있을 경우 정정 요구<br/>
 3. 삭제요구<br/>
 4. 처리정지 요구<br/><br/><br/><br/>


 6. 처리하는 개인정보의 항목 작성 <br/><br/>

 ① ('http://www.kingofday.co.kr/'이하 'KingofDay')은(는) 다음의 개인정보 항목을 
 	처리하고 있습니다.<br/><br/>

 - 필수항목 : 이메일, 휴대전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 
 			취미, 주민등록번호, 은행계좌정보, 서비스 이용 기록, 접속 IP 정보, 결제기록<br/><br/>
 - 선택항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 성별, 은행계좌정보, 서비스 이용 기록, 
 			접속 로그, 접속 IP 정보, 결제기록<br/><br/><br/><br/>



 7. 개인정보의 파기('KingofDay')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 
 	개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br/><br/>

	-파기절차이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 
	및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률
	에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br/><br/>
	-파기기한이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 
	개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 
	개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br/><br/><br/><br/>



 8. 개인정보의 안전성 확보 조치 ('KingofDay')은(는) 개인정보보호법 제29조에 따라 다음과 같이 
 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br/><br/>

 1. 정기적인 자체 감사 실시<br/>
 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br/><br/>

 2. 개인정보 취급 직원의 최소화 및 교육<br/>
 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br/><br/>

 3. 내부관리계획의 수립 및 시행<br/>
 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.<br/><br/>

 4. 해킹 등에 대비한 기술적 대책<br/>
 &lt;(주)킹오브데이&gt;('KingofDay')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 
 막기 위하여 보안프로그램을 설치하고 주기적인 갱신?점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 
 기술적/물리적으로 감시 및 차단하고 있습니다.<br/><br/>

 5. 개인정보의 암호화<br/>
 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 
 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br/><br/>

 6. 접속기록의 보관 및 위변조 방지<br/>
 개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 
 분실되지 않도록 보안기능 사용하고 있습니다.<br/><br/>

 7. 개인정보에 대한 접근 제한<br/>
 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 
 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br/><br/>

 8. 문서보안을 위한 잠금장치 사용<br/>
 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.<br/><br/>

 9. 비인가자에 대한 출입 통제<br/>
 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.<br/><br/><br/><br/>


 9. 개인정보 보호책임자 작성 <br/><br/>


 ① (주)킹오브데이(‘http://www.kingofday.co.kr/’이하 ‘KingofDay) 은(는) 
 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해
 구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br/><br/>


 ▶ 개인정보 보호책임자<br/>
     성명 :박강영<br/>
     직책 :CEO<br/>
     직급 :CEO<br/><br/>

    연락처 :02.536.1300, kingofdayinc@gmail.com, 02.536.1301<br/>
    ※ 개인정보 보호 담당부서로 연결됩니다.<br/><br/>


 ▶ 개인정보 보호 담당부서<br/>
     부서명 :<br/>
     담당자 :<br/>
     연락처 :, ,<br/>
 ② 정보주체께서는 (주)킹오브데이(‘http://www.kingofday.co.kr/’이하 ‘KingofDay)
 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 
 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다.<br/>
 (주)킹오브데이(‘http://www.kingofday.co.kr/’이하 ‘KingofDay) 은(는) 정보주체의
 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br/><br/><br/><br/>



 10. 개인정보 처리방침 변경 <br/><br/>

 ①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 
 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br/><br/><br/><br/>




			</p>
			</div>
			</div>
		</div>
</div>


<script>
$("#tosBtn").on("click", function(){
	$("#tos").show();
	$("#privacy").hide();
	$("#tosBtn").attr("src", "/webView/img/common/tos/kr/tos_btn_on.png");
	$("#privacyBtn").attr("src", "/webView/img/common/tos/kr/privacy_btn.png");
})

$("#privacyBtn").on("click", function(){
	$("#privacy").show();
	$("#tos").hide();
	$("#tosBtn").attr("src", "/webView/img/common/tos/kr/tos_btn.png");
	$("#privacyBtn").attr("src", "/webView/img/common/tos/kr/privacy_btn_on.png");
})

</script>
</body>
</html>