var nickCheck = $("#nickCheck").val();


$("#duplCheck").on("click" , function(){
	
	var nick = { "nick":$("#nickName").val() };
	
	$.ajax({
		type: "POST"
		, url: "/login/duplCheck"
		, data: {param:nickName, value:$("#nickName").val()}
		, dataType: "text"
		, success: function(nick, data){
		
			if(nick == "success"){
				alert("사용 가능합니다.")
				$("#nickCheck").val("success");
			} else {
				alert("이미 사용중입니다. 다른 이름을 사용하세요.")
				$("#nickCheck").val("false");
			}
		}
		, error: function(){
			alert("중복체크 중 오류발생. 잠시후 다시 시도해 주세요.");
			$("#nickCheck").val("false");
		}
	});
})



$("input[type=submit]").on("click", function(){
	if ( $("#pass").val() != $("#passCheck").val() ){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else if ( $("#pass").val() == $("#passCheck").val() ) {
		
		if( $("#nickCheck").val() == "success"){
			alert(" 회원정보가 수정되었습니다.")
			$("#myInfoForm").attr("action","/login/updateMyInfo").submit();
		} else {
			alert("닉네임 중복체크를 해주세요.");
			return false;
		}
	};
	
})




$("#imgChangeBtn").on("click", function(){
	
	$("#imgFile").click();
	
})


function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if( !f.type.match("image.*")) {
			alert("이미지 파일이 아닙니다.");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#imgProfile").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

$("#imgFile").on("change", handleImgFileSelect);

$("#nickChange").on("click", function(){
	$("#nickName").attr("readonly",false);
	$("#nickChange").hide();
	$("#duplCheck").show();
	$("#nickCheck").val("false");
})

$("#nickName").on("click", function(){
	$("#nickCheck").val("false");
})
