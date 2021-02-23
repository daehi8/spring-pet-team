<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %>
<!doctype html>
<html lang="en">
<head>
</head>
<script language="javascript">
</script>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">

<h1 style="text-align: left">체크리스트</h1></br>
<form name="fwrite" method="post" action="checkPro.do?check_no=${check_no}" onsubmit="return frmchk();">
	
<table>
<c:forEach items="${list}" var="dto" varStatus="st">
		<div style="text-align: left">
      <h6 style="text-align: left"> ${st.count}. ${dto.quest_title}</h6>
         <input type="radio"  name="answer${st.count}" value="5"> ${dto.quest_ans1}
         <input type="radio"  name="answer${st.count}" value="4"> ${dto.quest_ans2}
         <input type="radio"  name="answer${st.count}" value="3"> ${dto.quest_ans3}
         <input type="radio"  name="answer${st.count}" value="2"> ${dto.quest_ans4}
         <input type="radio"  name="answer${st.count}" value="1"> ${dto.quest_ans5}
         </div>
		<br>
		<br>
</c:forEach>
</table>

<input class="btn btn-dark" value="목록" onclick="location.href='/pet/check/checklist.do'">
<input class="btn btn-dark" type="submit" value="결과확인 ">
</form>


</div>
</div>