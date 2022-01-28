$(function() {
	console.log("pagenation");
	
    let totalContent = 0;
	let tag = document.getElementById("endIdx").value;
    if( typeof tag == "string") {
        totalContent = parseInt(tag);
        console.log(totalContent);
    }
	console.log(totalContent);
	
	let pageCount = 10;
	let viewContent = 10;
	
	let pageNum = Math.ceil(totalContent / viewContent); // 페이지의 갯수 : 전체 컨텐츠 수 / 보줄 컨텐츠 수  => 12/10 = 1페이지, 99/10 => 9페이지, 109/10 => 10페이지 +1
    if (pageNum < pageCount){
        pageCount = pageNum;
    }
    
	
    // 페이지 갯수 셋팅하기
    let i = 1;
    while(i <= pageNum) {
        let a_tag = $('#currentPage').text(i);
        console.log("a_tag" + a_tag);
        $('#parent_li').push(a_tag);
        i++;
        console.log(i);
        if(i == pageNum) { break; } 
    }
	
	 
}); // end of main func