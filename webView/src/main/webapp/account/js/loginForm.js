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