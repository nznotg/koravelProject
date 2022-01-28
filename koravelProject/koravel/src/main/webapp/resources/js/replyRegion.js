$(function(){
	console.log('페이지 실행');
		
	$('#replyConfirm').click(function(){
		var param = $('#reviewFrm').serialize();//자기가 알아서 name / value 를 구분해주는 함수
		
		$.ajax({
			type: 'post',
			data : param, //보낼 때 쓰는 속성
			url: '../replies/new',
			success: function(result){
				$('#reply').val(''); // 사용자가 입력한 것을 지워주
				location.reload(); // 댓글이 새로 추가되면 '목록 보기'함수 실행시켜서 추가된 댓글 볼 수 있게
			},
			error : function(err){
				alert('fail');
			}
		}); // end of ajax
	}) // end of click
	
	//수정 버튼 추가
	$('.date').mouseover(function() {
		let button = "<div id='modifyButton'><button class='modify'>수정</button><button class='delete'>삭제</button><div>"
		$('div#modifyButton').remove()
		$(this).parent().append(button);

	}) // end of mouseover
	
	// 댓글 수정 - 1단계 : [수정] 버튼 클릭 시 이벤트 처리하기 => 클릭 이벤트 발생한 행 바로 밑에 수정 행 삽입
	$(document).on("click", "button.modify", function(){
		// 수정 수행 변수 만들기
		let tag = $(this).parent().parent().prev().prev().filter(':first') // h4태그의 reviewContent 
		let parentTag = tag; // h4태그의 부모 태그 = div.review6
		var reviewContent = tag.text(); // 내용을 가져오기
		reviewContent = reviewContent.trim(); // 가져온 내용의 앞, 뒤 공백 제
		var append_input = "<input class='contents' type='text' value='" + reviewContent + "'>";
		
		// Check for right text extraction
		console.log("tag : " + tag);
		console.log("reviewContent :" + reviewContent);
		console.log(parentTag);
		
		// parentTag 비우고 input 넣기
		parentTag.empty();
		parentTag.append(append_input);
		
		//수정 완료 태그 만들기
		let complete = "<button class='complete'>완료</button><button class='cancle'>취소</button>"
		let tag2 = $(this).parent(); // button 태그들의 부모 노드
		tag2.empty(); // 부모 노드 비우고
		tag2.append(complete); // 새로 추가해주기
	}) // end of click
	
	// 댓글 수정 - 2단계 : [완료] 버튼 클릭 시 이벤트 처리하기 => 클릭 이벤트 발생한 행 바로 밑에 수정 행 삽입
	$(document).on("click", "button.complete", function(){
		let tag = $(this).parent().parent().prev().prev().filter(':first') // 사용할 태그 변수
		let reviewContent = $('.contents').val(); //수정한 텍스트 가져오기
		reviewContent = reviewContent.trim()
		console.log("2단계 reviewContent : " + reviewContent)
		let reviewIdx = tag.prev().val(); 
		console.log("2단계 reviewIdx : " + reviewIdx);
		let regionIdx = tag.prev().prev().val(); 
		console.log("2단계 regionIdx: " + regionIdx);
		
		
		// 수정사항
		var param = {"regionIdx":regionIdx, "reviewIdx":reviewIdx, "reviewContent":reviewContent};
		console.log(param);
		
		$.ajax({
			type: 'get',
			data: param,
			url: '../replies/' + regionIdx,
			success: function(result){
				// 수정한 텍스트를 다시 h4 태그로 넣어주기
				var append_htag = "<h4>" + reviewContent + "<h4>";
				tag.html(append_htag); // => html() 이용하여 하위 태그들의 값 변
				
				//button 태그들 지우기
				let tag2 = $(this).parent();
				tag2.remove();
				
				// 댓글 목록 호출
				//replyList();
				
				
				
				alert('수정 완료');
				
			}, // end of success func
			error: function(err) {
				alert('수정 실패');
				console.log(err)
			} // end of error func
		}) // end of ajax
	}) // end of click
	
	
	
	// 댓글 수정 취소 - 3단계 : [취소] 버튼 클릭 시 이벤트 처리하기 => 완료/취소 버튼 태그들 없애기 
	$(document).on("click", "button.cancle", function(){
		location.reload();
	}); //end of click cancle
	
	
	


	
});