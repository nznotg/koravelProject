$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
//	$('#confirm').click(function(evn){
//		
//    	if( $.trim($("#usrID").val()) == '' ){
//            alert("아이디를 입력해 주세요.");
//            $("#usrID").focus();
//            return ;
//        }
//    	
//    	if($.trim($('#usrPasswd').val())==''){
//    		alert("비번입력해주세요.");
//    		$('#usrPasswd').focus();
//            return ;
//    	}
//    	
//    	if($.trim($('#usrPasswd').val()) != $.trim($('#usrPasswd2').val())){
//    		alert("비밀번호가 일치하지 않습니다..");
//    		$('#usrPass2').focus();
//            return ;
//    	}
//    	
//    	if($.trim($('#usrEmail').val()) != $.trim($('#usrEmail2').val())){
//    		alert("이메일이 일치하지 않습니다...");
//    		$('#usrPass2').focus();
//            return ;
//    	}
//    	
//    	if($.trim($('#usrNick').val())==''){
//    		alert("이름입력해주세요.");
//    		$('#usrNick').foucs();
//            return ;
//    	}
//       
//        // 자료를 전송합니다.
//        document.usrinput.submit();
//	});
	
	//아이디 중복체크
	$('#usrID').keyup(function(){
        
       $.ajax({
    	   type : 'get',
    	   url : 'idCheck.do',
    	   data : { usrID :$('#usrID').val()},
  
    	   success :        function xxxx (result){
        	   $('#idCheckResult').text(result);
           },
    	   error : function(err){
	   alert('fail');
    	   }
       });

	})	
	$('#confirm').click(function(){
        
       $.ajax({
    	   type : 'get',
    	   url : 'emailCheck.do',
    	   data : { usrEmail :$('#usrEmail').val()},
  
    	   success :        function yyyy (res){
        	   $('#emailCheckResult').text(res);
           },
    	   error : function(err){
	   alert('fail');
    	   }
       });

	})
})
	