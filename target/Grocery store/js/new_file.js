
	
		$(function(){
			
		
	 $(".detailsclick").click(function(){
		 	$("div[class*=displayall]").css("display","none");
		 	var classname=$(this).attr("name");
			
			$("div[id="+classname+"]").show();

		 });
		 
		$("#address").click(function(){
			$("#newsite").show();
		})
		 $("#newsite").find("input").click(function(){
		 	$("#newsite").hide();
		 })
		  
		 
		})
		

		