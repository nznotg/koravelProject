<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 등록</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
<script  src="../resources/js/js_usrinput.js"></script>
<script>
	window.onload = function(){
		document.getElementById('Submit').onclick = check;	
	}
	
	function check(){
		
		$('#Submit').on('click', function({
			if('#usrPasswd').val() == ""){
				alert("비밀번호를 입력해주세요!");
				$('#usrPasswd').focus();
				return false;
		}
			if('#usrPasswd2').val() == ""){
				alert("비밀번호를 한 번 더 입력해주세요!");
				$('#usrPasswd2').focus();
				return false;
		}
		
		});
	}

</script>
</head>
<style>

.normalbold {  font-family: "굴림", "돋움"; font-size: 25px;
font-style: normal; font-weight: bold; text-decoration: none}

table{ width:450px;  margin:auto;  } /* 테이블 가운데 정렬  */

.table1 {  width:390px; border:0px; cellspacing:0px; cellpadding:5px; font-size:16px; }
.table2 {  width:390px;  cellspacing:0; cellpadding:3px; }

.tb_ttl {background:#f1f2f3;   }
	input[type=text]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
		box-size:.3s;
		font-size:20px;
		width:450px;
	}
	input[type=text]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=password]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
		box-size:.3s;
		font-size:20px;
		width:450px;
	}
	input[type=password]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=email]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
		box-size:.3s;
		font-size:20px;
		width:450px;
	}
	input[type=email]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=date]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
		box-size:.3s;
		font-size:20px;
		width:450px;
	}
	input[type=date]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
</style>

<body bgcolor="#FFFFFF">
<%
	session.getAttribute("usrNick");
%>
	<div align="center">
    <img alt="LogoKoravel" src="../resources/images/koravel.png" width="auto" height="40"><font size="30"><b> 회 원 정 보</b></font>
    </div>
 	<div align="center" style="font-size: 25px;"> 
    좋은 여행정보가 가득한 KORAVEL 입니다.<br>
    ${usrNick.usrID }님의 회원정보입니다.
     <Strong>변경이 필요한 부분</Strong>은 정확히 기재해 주세요.<br>
      </div>
<form method="post" action="usrUpdate.do" name="update" enctype="multipart/form-data">
  <table >
    <tr> 
      <td class="normalbold tb_ttl"> 
        <div align="left">
 				<i class="fas fa-portrait fa-fw " aria-hidden="true"></i>사용자 ID
        <span id="idCheckResult"   style="align:right;font-size:14px;width:150px;color:red"></span></div>
      </td>
    </tr>
    <tr> 
      <td class="normal"> 
        <input type="text" name="usrID" id="usrID" value="${usrNick.usrID }"size="20" readonly="readonly"> 
      </td>
    </tr>
    <tr> 
      <td class="normalbold tb_ttl" align="left">
        <div ><i class="fas fa-lock fa-fw" aria-hidden="true"></i>비밀번호</div>
      </td>
    </tr>
    <tr> 
      <td  class="normal" align="left"> 
        <input type="password" name="usrPasswd" id="usrPasswd">
      </td>
    </tr>
    <tr> 
      <td class="normalbold tb_ttl" align="left"> 
        <div ><i class="fas fa-lock  fa-fw" aria-hidden="true"></i>비밀번호 확인</div>
      </td>
    </tr>
    <tr> 
      <td > 
        <input type="password" name="usrPasswd2" id="usrPasswd2">
      </td>
    </tr>
    <tr>
    <td class="normalbold tb_ttl" align="left"> 
        <div ><i class="fas fa-user-tag  fa-fw" aria-hidden="true"></i>사용자 닉네임</div>
      </td>
    </tr>
    <tr> 
      <td  class="normal"> 
        <input type="text" name="usrNick" id="usrNick" value="${usrNick.usrNick }">
      </td>
   </tr>
    <tr> 
      <td class="normalbold tb_ttl" align="left">
		<div ><i class="fas fa-birthday-cake  fa-fw" aria-hidden="true"></i>생년월일</div>
	  </td>
    </tr>
    <tr> 
      <td class="normal"> 
	  	<input type="date" name="usrBirth" id="usrBirth" value="${usrNick.usrBirth }">
      <td>
    </tr>
    <tr>
    	<td class="normal">
    		<button type="Submit" id="Submit" style="border: none; outline: none;">
       			<img alt="" src="../resources/images/login/update1.png" style="border: none; outline: none; width:100px; height: 50px;">
      		</button>
      		<button onclick="javascript:history.back()" style="border: none; outline: none; width:50px; height: 50px; ">
  				<img alt="" src="../resources/images/login/cancel2.png" style="width:100px; height: 50px;">
      		</button>
      	</td>
    </tr>
  </table>
</form>
</body>
</html>
