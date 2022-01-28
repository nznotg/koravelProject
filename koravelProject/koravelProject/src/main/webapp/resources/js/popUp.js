$(function(){
	$("#keywordPopup").click(function(){
		var url = "keywordPopup.do";
	    var name = "popup test";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	    window.open(url, name, option);
	})
})