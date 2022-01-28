$(function() {
	
	console.log('recommand.jsp 페이지 실행');
	
	$('.webstandard > a').mouseover(function(){
		let regionSumAddr = $(this).text().slice(0,2);
		console.log(regionSumAddr);
		let url = "recommand.do?regionSumAddr='" + regionSumAddr + "'";
		
		$(this).attr("href", url);
		
		
	}); // end of .webstandard click func

}); //end of main func
