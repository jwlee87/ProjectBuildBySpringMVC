
var slideIndex = 0;
showSlides();

function showSlides() {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";  
	}
	slideIndex++;
	if (slideIndex > slides.length) {slideIndex = 1}    
	    
	slides[slideIndex-1].style.display = "block";  
	dots[slideIndex-1].className += " active";
	setTimeout(showSlides, 2000); // Change image every 2 seconds
}
	/* 검색 폼 지우기.js */
function focusOut() {
	var x = document.getElementById("search");
	//x.value="";
}
	/* 오늘 날짜 요일 받아오기.js */
var today = new Date();
var year = today.getFullYear();
var month = today.getMonth()+1;
var date = today.getDate();
var dayLabel = today.getDay();

function getTodayLabel(){
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var todayLabel = week[dayLabel];
	return todayLabel;
}
var day = getTodayLabel();
var todayInfo = year+"년 "+month+"월 "+date+"일 "+day+"요일";
$("#infoToday").html(todayInfo)

	/*네비바 이미지 조절*/
var width = $(window).width();
if(width <= 1920 && width > 1700)		$(".menu").css("background-image", "url('/resources/images/menubg.png')");
else if(width <= 1700 && width > 1440)	$(".menu").css("background-image", "url('/resources/images/menubg2.png')");
else if(width <= 1440 && width <= 1280)	$(".menu").css("background-image", "url('/resources/images/menubg2.png')");
else if(width < 1280 && width <= 1000)	$(".menu").css("background-image", "url('/resources/images/menubg2.png')");
$(window).resize(function(){
	//코드 넣는 곳
	console.log($(window).width())
	var width = $(window).width();
	if(width <= 1920 && width > 1700)		$(".menu").css("background-image", "url('/resources/images/menubg.png')");
	else if(width <= 1700 && width > 1440)	$(".menu").css("background-image", "url('/resources/images/menubg2.png')");
	else if(width <= 1440 && width <= 1280)	$(".menu").css("background-image", "url('/resources/images/menubg2.png')");
	else if(width < 1280 && width <= 1000)	$(".menu").css("background-image", "url('/resources/images/menubg2.png')");
})

	/*로그아웃 이미지 변경*/
$("#logout").mouseover(function(){
	$("#logoutBtnImg").prop("src","/resources/images/logoutBtn2.png");
})
$("#logout").mouseout(function(){
	$("#logoutBtnImg").prop("src","/resources/images/logoutBtn1.png");
})