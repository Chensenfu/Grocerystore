$(function(){
	$("button[class*=dec]").click(function() {
			var count = parseInt($(this).siblings("input").val()) - 1;
			if (count < 1) {
				alert("不能再减了，再减就没有啦！");
				$(this).siblings("input").val(count+1);
			} else {
				$(this).siblings("input").val(count);
			}
		})
	$("button[class*=plus]").click(function() {
			var count = parseInt($(this).siblings("input").val()) + 1;
			$(this).siblings("input").val(count);
		});
})