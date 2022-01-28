<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 등록</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- 
          정적자원들은 resources 폴더에 저장
	 현재 프로젝트명에서 user 경로를 더한 상태이기에 상위경로를 올라갔다가 resources를 찾음.
 -->
<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
<script  src="../resources/js/js_usrinput.js"></script>
<script>

	window.onload = function(){
		document.getElementById('Submit').onclick = check;	
	}
	
	function check(){
		if(document.form.usrID.value==""){
			alert("ID를 확인 해주세요.")
			document.form.usrID.focus();
			return false;
		}
		
		if(document.form.usrPasswd.value != document.form.usrPasswd2.value){
			alert("비밀번호를 확인 해주세요.")
			document.form.usrPasswd.focus();
			return false;
		}
		if(document.form.usrPasswd.value==""){
			alert("비밀번호를 확인 해주세요.")
			document.form.usrPasswd.focus();
			return false;
		}
		if(document.form.usrEmail.value==""){
			alert("이메일을 확인 해주세요.")
			document.form.usrPasswd.focus();
			return false;
		}
		if(document.form.usrNick.value==""){
			alert("닉네임을 확인 해주세요.")
			document.form.usrPasswd.focus();
			return false;
		}
		if(document.form.usrBirth.value==""){
			alert("생년월일을 확인 해주세요.")
			document.form.usrPasswd.focus();
			return false;
		}
		
		document.form.submit();//전송
	}
</script>
</head>

<style>
/* .normal {  
font-family: "굴림", "돋움"; 
font-size: 12; 
font-style: normal; 
font-weight:normal; 
text-decoration: none;
 } */

.normalbold {  font-family: "굴림", "돋움"; font-size: 20px;
font-style: normal; font-weight: bold; text-decoration: none}

/* td{font-weight:bold; }
a{text-decoration:none} */



table{ width:310px;  margin:auto;  } /* 테이블 가운데 정렬  */

.table1 {  width:390px; border:0px; cellspacing:0px; cellpadding:5px; font-size:16px; }
.table2 {  width:390px;  cellspacing:0; cellpadding:3px; }

.tb_ttl {background:#ffffff;   }
	input[type=text]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
/* 		padding:8px;
 */		box-size:.3s;
		font-size:20px;
		width:310px;
	}
	input[type=text]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=password]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
/* 		padding:8px;
 */		box-size:.3s;
		font-size:20px;
		width:310px;
	}
	input[type=password]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=email]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
/* 		padding:8px;
 */		box-size:.3s;
		font-size:20px;
		width:310px;
	}
	input[type=email]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
	input[type=date]{
		border: 2px solid #aaa;
 		margin:2px 0;
		outline:none;
/* 		padding:8px;
 */		box-size:.3s;
		font-size:20px;
		width:310px;
	}
	input[type=date]:focus{
		border-color:dodgerBlue;
		box-shadow:0 0 8px 0 dodgerBlue;
	}
</style>

<body bgcolor="#FFFFFF" style="height: 800px;">
<br/>
<br/>

	<div align="center">
    <img alt="LogoKoravel" src="../resources/images/koravel.png" width="auto" height="40"><font size="30"><b> 회 원 가 입</b></font>
    </div>
 	<div align="center"> 
    좋은 여행정보가 가득한 KORAVEL 입니다.<br>
      아이디, 비밀번호를 찾기위해 <br/>이메일을 정확히 기재해 주세요.
      </div>

<br/>
<form method="post" action="usrInsert.do" name="form" >
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
        <input type="text" name="usrID" id="usrID" size="20"> 
      </td>
    </tr>
    <tr> 
      <td class="normalbold tb_ttl">
        <div ><i class="fas fa-lock  fa-fw" aria-hidden="true"></i>비밀번호</div>
      </td>
    </tr>
    <tr> 
      <td  class="normal"> 
        <input type="password" name="usrPasswd" id="usrPasswd">
      </td>
    </tr>
    <tr> 
      <td class="normalbold tb_ttl"> 
        <div ><i class="fas fa-lock  fa-fw" aria-hidden="true"></i>비밀번호 확인</div>
      </td>
    </tr>
    <tr> 
      <td > 
        <input type="password" name="usrPasswd2" id="usrPasswd2">
      </td>
    </tr>
    <tr>
      <td class="normalbold tb_ttl"> 
          <div ><i class="fas fa-envelope  fa-fw" aria-hidden="true"></i>이메일<input type="button" value="확인" name="confirm" id="confirm">
        <span id="emailCheckResult"   style="align:right;font-size:14px;width:150px;color:red"></span></div>
      </td>
    </tr>
    <tr> 
	  <td>
	  	<input type="email" name="usrEmail" id="usrEmail" >	      
    </td>
    </tr>
<!--     <tr> 
      <td class="normalbold tb_ttl"> 
          <div ><i class="fas fa-envelope fa-fw" aria-hidden="true"></i>이메일 확인</div>
      </td>
    </tr>
    <tr> 
	  <td>
	  	<input type="email" name="usrEmail2" id="usrEmail2" >	      
    </td>
   </tr>
    <tr> 
 -->      <td class="normalbold tb_ttl"> 
        <div ><i class="fas fa-user-tag  fa-fw" aria-hidden="true"></i>사용자 닉네임</div>
      </td>
    </tr>
    <tr> 
      <td  class="normal"> 
        <input type="text" name="usrNick" id="usrNick">
      </td>
   </tr>
    <tr> 
      <td class="normalbold tb_ttl">
		<div ><i class="fas fa-birthday-cake  fa-fw" aria-hidden="true"></i>생년월일</div>
	  </td>
    </tr>
    <tr> 
      <td class="normal"> 
	  	<input type="date" name="usrBirth" id="usrBirth" >	      
    </tr>
    <tr>
      <td  class="normal"> 
        <div align="center"> 
          <input type="image" name="Submit" id="Submit"  src="../resources/images/login/join.png" value="등   록" >
          </div>
          </td>
          </tr>
          <tr>
          <td>
      </td>
    </tr>
  </table>
          <div align="center">
    		<input type="image" src="../resources/images/login/cancel.png" value="취소"  onclick="javascript:history.back()">
        </div>
        <br>
	<div align="center"><b>
	질문에 응해주세요.(선택사항)<br/>
	여행지를 선택된 질문을 반영하여 보여드립니다.<br/>
	마이페이지에서 재설정 가능합니다. </b>
	
	</div>
	<table>
		<tr>
			<td>
				<input type="radio" name="chk_info" value="calm">조용한
				<input type="radio" name="chk_info" value="active" checked="checked">활발한
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="chk_info" value="sea">바다
				<input type="radio" name="chk_info" value="mt" checked="checked">산
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="chk_info" value="family">가족
				<input type="checkbox" name="chk_info" value="couple">데이트
				<input type="checkbox" name="chk_info" value="solo">혼자만의<br/>
				<input type="checkbox" name="chk_info" value="experience">체험
				<input type="checkbox" name="chk_info" value="kid">아이들과
			</td>
		</tr>
	</table>
</form>
</body>
</html>
