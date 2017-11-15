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
	
	<table width="100%">
	<tr><td>
	<textarea rows="20" cols="110" style="display: block; margin: 0 auto;">


						[회사 개인정보처리방침]


 &lt;킹오브데이&gt;('king of day'이하 "킹오브데이")은 개인정보 보호법에 따라 이용자의 개인정보 보호 및 권익을
보호하고 개인정보와 관련한 이용자의 고충을 원할하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.


			
 "킹오브데이"는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항 (또는 개별공지)을 통하여 공지할 것입니다.
※ 본 방침은 2017년 11월 1일부터 시행됩니다.



 1.개인정보의 처리 목적
 
    -"킹오브데이"는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지
    않으며, 이용 목적이 변경될 시에는 사전 동의를 구할 것입니다.

  가.홈페이지 회원가입 및 관리
    - 회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별/인증, 회원자격 유지/관리, 서비스 부정이용 방지,
   각종 고지/통지 등을 목적으로 개인정보를 처리합니다.

  나.재화 또는 서비스 제공
    - 서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 요금결제/정산 등을 목적으로 개인정보를 처리합니다.

  다.마케팅 및 광고에의 활용
    - 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에
    따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을
    목적으로 개인정보를 처리합니다.



 2.개인정보 수집 현황

  가."킹오브데이" 어플리케이션 운영 개인정보
    - 개인정보 항목: 아이디, 비밀번호, 닉네임, 이메일 주소, 홈페이지 주소, 서비스 이용기록, 접속로그,
      접속 IP정보, 사용자 유형
    - 수집방법: 어플리케이션, 웹
    - 보유근거: 상법, 전자상거래 등에서의 소비자보호에 관한 법률, 통신비밀보호법
    - 보유기간: 계약 또는 청약철회 등에 관한 기록: 5년

      > 대금결제 및 재화 등의 곱급에 관한 기록: 5년
      > 소비자의 불만 또는 분쟁처리에 관한 기록: 3년



 3.개인정보처리 위탁

  가."킹오브데이"는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

  나."킹오브데이"는 위탁계약 체결시 개인정보 보호법 제 25조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
    기술적 관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리 감독, 손해배상 등 책임에 관한 사항을 계약서
    등 문서에 명시 하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

  다.위탁업무의 내용 또는 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.



 4.정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.
 
  가.정보주체는 스페셜에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
    ㄱ.개인정보 열람요구
    ㄴ.오류 등이 있을 경우 정정 요구
    ㄷ.삭제 요구
    ㄹ.처리 정지 요구

  나. 가 항에 따른 권리 행사는 "킹오브데이"에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면,
    전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 &lt;기관/회사명&gt;('사이트URL'이하 '사이트명')은(는)
    이에 대해 지체 없이 조치하겠습니다.

  다.정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 &lt;기관/회사명&gt;
    ('사이트URL'이하 '사이트명')은(는) 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지
    안습니다.

  라. 가 항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우
    개인정보보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.



 5.처리하는 개인정보의 항목 작성

  가."킹오브데이"는 다음의 개인정보 항목을 처리하고 있습니다.

    &lt;홈페이지 회원가입 및 관리&gt;
      - 필수항목: 휴대전화번호, 이름, 이메일, 사용자 유형

    &lt;재화 또는 서비스 제공&gt;
      - 필수항목: 휴대전화번호, 이름, 이메일, 사용자 유형

    &lt;마케팅 및 광고의 활용&gt;
      - 필수항목: 휴대전화번호, 이름, 사용자 유형



 6.개인정보의 파기
 
  "킹오브데이"는 원칙적으로 개인정보 처리목적이 달성된 경우 별도의 조치없이 바로 해당 개인정보를 파기합니다.
  파기의 절차, 기한 및 방법은 다음과 같습니다.
  
    - 파기절차이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및
      기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한
      경우가 아니고서는 다른 목적으로 이용되지 않습니다.
      
    - 파기기한이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에,
      개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의
      처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.



 7.개인정보의 안전성 확보 조치

  "킹오브데이"는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고
  있습니다.
  
  가.정기적인 자체 감사 실시
    - 개인정보 취급 관련 안전성 확보를 위해 정기적으로 자체 감사를 실시하고 있습니다./분기별 실시

  나.개인정보 취급 직원의 최소화 및 교육
    - 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
  
  다.내부관리계획의 수립 및 시행
    - 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.
    
  라.해킹 등에 대비한 기술적 대책
    - "킹오브데이"는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고
      주기적인 갱신/점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고
      있습니다.
      
  마.개인정보의 암호화
    - 이용자의 개인정보는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송
      데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

  바.접속기록의 보관 및 위변조 방지
    - 개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지
      않도록 보안기능을 사용하고 있습니다.

  사.개인정보에 대한 접근 제한
    - 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를
      위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터 무단 접근을 통제하고 있습니다.



 8.개인정보 보호책임자 작성

  가."킹오브데이"는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보처리와 관련한 정보주체의 불만처리 및
    피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
    
      ▶개인정보 보호책임자
        - 성명: 박강영
        - 직책: 본부장
        - 직급: 본부장
          연락처: 02. 536. 1300 / kingofdayinc@gmail.com
          ※개인정보 보호 담당부서로 연결됩니다. / 원활한 연락을 위해 메일로 문의를 주실 경우 더욱 빠르게 답변을
            받으실 수 있습니다.



 9.개인정보 처리방침 변경

  가.이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는
    변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.
	</textarea></td></tr>
	<tr><td>
	<input id="agreeCheck" type="checkbox" name="agree" value="agree" class="checkbox"
		style="float: right; margin-right:110px; margin-top: 20px;">
	<span style="font-family:Nanum Gothic, sans-serif; font-size:13px; color:#838383;
		float: right; margin-right: -50px; margin-top:18px;">동의</span>
	</td></tr>
	<tr>
		<td style="text-align: center;"><input id="nextBtn" type="image" src="/resources/images/nextbtn.png" style="margin-top: 20px;"><br/></td>
	</tr>
	</table>
	</div><!--end loginform-->
	</div><!--end logincon-->

<script>

	$("#nextBtn").on("click", function(){
		if( $("#agreeCheck").prop("checked") ) {
			location.href="register.jsp"
		} else {
			alert("이용약관에 동의 해주세요.")
		}
	})

</script>
</body>
</html>