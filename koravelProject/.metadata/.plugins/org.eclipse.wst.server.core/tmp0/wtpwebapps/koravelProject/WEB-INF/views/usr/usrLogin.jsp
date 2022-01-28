<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	.loginBox{
		border: 2px solid #aaa;
		 margin:8px ; 
		width:290px;
		outline:none;
		padding:8px;
		border-radius: 15px;
	}
	input[type=text]{
		width:208px;
		border: 2px solid #aaa;
		margin:8px 0;
		outline:none;
		padding:8px;
		box-size:.3s;
		font-size:25px;
	}
	input[type=text]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=password]{
		width:208px;
		border: 2px solid #aaa;
		margin:8px 0;
		outline:none;
		padding:8px;
		box-size:.3s;
		font-size:25px;
	}
	input[type=password]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}

	.inputWithIcon{
		position:relative;	
	}
	.inputWithIcon i{
		positioin:absolute;
		left:0;
		top:8px;
		padding:9px 8px;
		color:#aaa;
	}
.login_container{
	width:100%;
	height: 100vh;
	display: -webkit-box;
	display: -ms-flexbox;
  	display: flex;
  	-webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
  	-webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
}

</style>
</head>
<script>
	window.onload = function(){
		document.getElementById('Submit').onclick = check;	
	}
	
	function check(){
		if(document.form.usrID.value==""){
			alert("ID를 입력하세요.")
			document.form.usrID.focus();
			return false;
		}
		
		if(document.form.usrPasswd.value==""){
			alert("패스워드를 입력하세요.")
			document.form.usrPasswd.focus();
			return false;
		}
		
		document.formID.submit();
	}
</script>
<body>
	
<div class="login_container">
	<form id="formID" name="form" action="login.do" method="post">
	<div id="koravel">
	<img alt="LogoKoravel" src="../resources/images/koravel.png" width="320px;" height="75"  >
	</div>
		<div class="loginBox" align="center">
 			<div  align="center">
			<img alt="login" src="../resources/images/login/login.png" width="auto" height="30" align="center">	
 		    </div>
 			<div class="inputWithIcon" align="center">
 				<i class="fas fa-portrait fa-2x fa-fw " aria-hidden="true"></i>
 				<input type="text" name="usrID" id="usrID" placeholder="아이디" class="loginInput">		
 		    </div>
    		<div class="inputWithIcon" align="center">
    			<i class="fas fa-lock fa-2x fa-fw" aria-hidden="true"></i>
       			<input type="password" name="usrPasswd" id="usrPasswd"placeholder="패스워드" class="loginInput">
       		</div>
       </div>
       
 			<div  align="center">
    		<input type="image" name="Submit" id="Submit" src="../resources/images/login/loginButton.png" width="auto" height="54">
       		</div>
 	 
 			<div  align="center">
    		<input type="image"  src="../resources/images/login/usrJoin.png"  value="회원가입" onclick="location.href='usrJoin.do'">
    		<img alt='bar' src="../resources/images/login/bar.png">
    		<input type="image" src="../resources/images/login/cancel.png" value="취소" onclick="javascript:history.back()">
       		</div>
       		<font color="red">${message }</font>
       	</form>
</div>
</body>
</html>

















