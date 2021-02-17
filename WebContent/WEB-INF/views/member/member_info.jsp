<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<script>
		function select1(){
		$("#col1").css("display","none");
		$("#col2").css("display","block");
		$("#pwForm").css("display","none");
		$("#col4").css("display","none");
		}
		function select2(){
		$("#col1").css("display","none");
		$("#col2").css("display","none");
		$("#pwForm").css("display","block");
		$("#col4").css("display","none");
		}
		function select3(){
		$("#col1").css("display","none");
		$("#col2").css("display","none");
		$("#pwForm").css("display","none");
		$("#col4").css("display","block");
		}
	</script>
</head>
     
	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
     
	<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link active btn btn-outline-dark" href="javascript:return false;">프로필</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link btn btn-outline-dark" href="javascript:return false;" onclick="select1();">본인인증</a>
  	</li> 	
  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="javascript:return false;" onclick="select2();">비밀번호 변경</a>
  	</li>  	
   	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="javascript:return false;" onclick="select3();">마케팅</a>
  	</li>
 	</ul>
	</nav>
	<br/>
	<br/>
	<br/>
	<br/>
	
	<form method="post" enctype="multipart/form-data" action="/pet/member/update_profile.do"   style="display:block"
		name="userinput" onSubmit="return checkIt()" id="col1">
	  	<table class="table">	
		    <tr>
			    <td width="300" rowspan="2">프로필 이미지</td>
			    <td width="200" rowspan="2"><img src="/pet/save/${member.org_profile}">
			    	<input type="hidden" name="org_profile" value="${member.org_profile}" />
			    	<input type="hidden" name="no" value="${member.no}" />
			    	<input type="file" name= "img" value="편집">
			    	
			    	
				</td>
			    <td width="200" rowspan="1">필명</td>
			    <td> 
			        <input type="text" name = "pen_name" value="${member.pen_name}">
			    </td>
		    </tr>
		    <tr>
		    <td width="200" rowspan="1">이메일</td>
		    <td> 
		    	${member.email}
			</td>
			</tr>
	   </table>
	    <div class="m-2 text-right">
	    <a href ="/pet/member/deleteForm.do"><U>회원탈퇴 하기</U></a>
	   </div>
	   <input class="btn btn-dark w-50 p-2" name="confirm" type="submit" value="수정하기">
	</form>


	<form method="post" action="/pet/member/checkCert.do" 
		name="userinput" onSubmit="return checkIt()" style="display:none" id="col2">
 		<table class="table" >
 		<input type="hidden" name="email" value="${member.email}" />
		    <tr>
			    <td width="200" colspan="2">이름</td>
			    <td width="200" colspan="2">
			   		<input type = "text" name = "name" value = "${member.name}">
			    </td>
			    <td width="200" rowspan="1">전화번호</td>
			    <td> 
			      <input type="text" name = "phone" value="${member.phone}">
			    </td>
		    </tr>
	   </table>
	    <input class="btn btn-dark w-50 p-2" type="submit" name="confirm" value="본인인증하기" >  
	</form>


	<form method="post" id="pwForm" action="/pet/member/update_pw.do" 
			name="userinput" onSubmit="return checkIt()" style="display:none">
	    <input type="hidden" name="email" value = "${member.email }">
	  	<table class="table">
	    <tr>
	    	<td width="200" colspan="2">기존 비밀번호</td>
	        <td width="200" colspan="2">
	        <input type = "password" id="old_pw" name="old_pw" required>
	               
	       	</td>
		</tr>
	    <tr>
	        <td width="200" colspan="2">새로운 비밀번호</td>
	        <td width="200" colspan="2">
	        <input type = "password" id="pw" name="pw" type="password" required>            
	        </td>
		</tr>
	    <tr>
	        <td width="200" colspan="2">새로운 비밀번호 확인</td>
	        <td width="200" colspan="2">
	        <input type = "password" id="pw2" type="password" required>
	        </td>
	   	</tr>
   	</table> 
    <input class="btn btn-dark w-50 p-2" type="submit" name="confirm" value="변경하기" > 
	</form>


	<form method="post" action="/pet/member/marketing.do" 
			name="userinput" onSubmit="return checkIt()" style="display:none" id="col4">
	  	<table class="table">
	    <tr>
	    	<td width="200" colspan="2">마케팅 정보 알림</td>
	        <td width="200" colspan="2">
	        	<input type = "checkbox" id = "yes" name = "marketing" value="${member.marketing }">동의
	            <input type = "checkbox" id = "no" name = "marketing" value="${member.marketing }">미동의
	        </td>
	    </tr>
	   </table>
	   <input class="btn btn-dark w-50 p-2" name="confirm" value="확인" >
	   </form>
   
   </div>
   </div>
   </html>
   