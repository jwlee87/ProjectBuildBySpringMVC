$(document).ready(function(){
	
	var userInputId = $.cookie("userInputId");
	$("input[name='id']").val(userInputId);
	
	if($("input[name='id']").val() != ""){
		$("#remember").attr("checked", true);
	}
	
	$("#remember").change(function(){
		if($("#remember").is(":checked")){
			var userInputId = $("input[name='id']").val();
			$.cookie("userInputId", userInputId, {expires: 15});
		}else{
			$.removeCookie("userInputId");
		}
	});
	
	$("input[name='id']").keyup(function(){
		if($("#remember").is(":checked")){
			var userInputId = $("input[name='id']").val();
			$.cookie("userInputId", userInputId, {expires: 15});
		}
	});
	
});