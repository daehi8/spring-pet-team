<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/pet/resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: orange;
}
</style>

</head>
<body>
<script>
document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    const rateForms = document.querySelectorAll('.rating'); /* 별점 선택 템플릿을 모두 선택 */
	rateForms.forEach(function(item){//클릭 이벤트 리스너 각각 등록
		item.addEventListener('click',function(e){
			let elem = e.target;
			if(elem.classList.contains('rate_radio')){
				rating.setRate(elem.parentElement, parseInt(elem.value)); // setRate() 에 ".rating" 요소를 첫 번째 파라메터로 넘김
			}
		})
	});
});


//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(rateobj, newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
	let checks = null;
	//요소가 파라메터로 넘어오면 별점 클릭, 없으면 저장 후 전체 초기화
	if(rateobj){
		rateobj.querySelector('.ratefill').style.width = parseInt(newrate * 60) + 'px'; // 현재 별점 갯수 채색
		checks = rateobj.querySelectorAll('.rate_radio'); // 넘어온 요소 하위의 라디오버튼만 선택
	}else{
		//전체 별점 채색 초기화
		const rateFills = document.querySelectorAll('.ratefill');
		rateFills.forEach(function(item){
			item.style.width = parseInt(newrate * 60) + 'px';
		});
		//전체 라디오 버튼 초기화
		checks = document.querySelectorAll('.rate_radio');
	}
	//별점 체크 라디오 버튼 처리
	if(checks){
		checks.forEach(function(item, idx){
			if(idx < newrate){
				item.checked = true;
			}else{
				item.checked = false;
			}
		});		
	}
}

let rating = new Rating();//별점 인스턴스 생성
</script>

	<form method = "post" enctype="multipart/form-data"  action="/pet/review/insertreviewpro.do">
		<!-- 테스트용 코드 -->
		<input type="hidden" name="member_email" value="test">
		
		인증사진
		<input type="file" name="auth"><br /><br />
		
		<h3>평점</h3>
		<div class="review_rating">
			<div>친절함</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="kind" id="rating11" value="1" class="rate_radio" title="1점">
                <label for="rating11"></label>
                <input type="checkbox" name="kind" id="rating12" value="2" class="rate_radio" title="2점">
                <label for="rating12"></label>
                <input type="checkbox" name="kind" id="rating13" value="3" class="rate_radio" title="3점" >
                <label for="rating13"></label>
                <input type="checkbox" name="kind" id="rating14" value="4" class="rate_radio" title="4점">
                <label for="rating14"></label>
                <input type="checkbox" name="kind" id="rating15" value="5" class="rate_radio" title="5점">
                <label for="rating15"></label>
            </div>
        </div>
	
		<div class="review_rating">
			<div>대기시간</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="waiting" id="rating21" value="1" class="rate_radio" title="1점">
                <label for="rating21"></label>
                <input type="checkbox" name="waiting" id="rating22" value="2" class="rate_radio" title="2점">
                <label for="rating22"></label>
                <input type="checkbox" name="waiting" id="rating23" value="3" class="rate_radio" title="3점" >
                <label for="rating23"></label>
                <input type="checkbox" name="waiting" id="rating24" value="4" class="rate_radio" title="4점">
                <label for="rating24"></label>
                <input type="checkbox" name="waiting" id="rating25" value="5" class="rate_radio" title="5점">
                <label for="rating25"></label>
            </div>
        </div>
        
		<div class="review_rating">
			<div>청결함</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="clean" id="rating31" value="1" class="rate_radio" title="1점">
                <label for="rating31"></label>
                <input type="checkbox" name="clean" id="rating32" value="2" class="rate_radio" title="2점">
                <label for="rating32"></label>
                <input type="checkbox" name="clean" id="rating33" value="3" class="rate_radio" title="3점" >
                <label for="rating33"></label>
                <input type="checkbox" name="clean" id="rating34" value="4" class="rate_radio" title="4점">
                <label for="rating34"></label>
                <input type="checkbox" name="clean" id="rating35" value="5" class="rate_radio" title="5점">
                <label for="rating35"></label>
            </div>
        </div>
        
        <div class="review_rating">
			<div>진료설명</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="detail" id="rating41" value="1" class="rate_radio" title="1점">
                <label for="rating41"></label>
                <input type="checkbox" name="detail" id="rating42" value="2" class="rate_radio" title="2점">
                <label for="rating42"></label>
                <input type="checkbox" name="detail" id="rating43" value="3" class="rate_radio" title="3점" >
                <label for="rating43"></label>
                <input type="checkbox" name="detail" id="rating44" value="4" class="rate_radio" title="4점">
                <label for="rating44"></label>
                <input type="checkbox" name="detail" id="rating45" value="5" class="rate_radio" title="5점">
                <label for="rating45"></label>
            </div>
        </div>
        
        <div class="review_rating">
			<div>가격</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="price" id="rating51" value="1" class="rate_radio" title="1점">
                <label for="rating51"></label>
                <input type="checkbox" name="price" id="rating52" value="2" class="rate_radio" title="2점">
                <label for="rating52"></label>
                <input type="checkbox" name="price" id="rating53" value="3" class="rate_radio" title="3점" >
                <label for="rating53"></label>
                <input type="checkbox" name="price" id="rating54" value="4" class="rate_radio" title="4점">
                <label for="rating54"></label>
                <input type="checkbox" name="price" id="rating55" value="5" class="rate_radio" title="5점">
                <label for="rating55"></label>
            </div>
        </div>
        
        <div class="review_rating">
			<div>치료후 결과</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="after" id="rating61" value="1" class="rate_radio" title="1점">
                <label for="rating61"></label>
                <input type="checkbox" name="after" id="rating62" value="2" class="rate_radio" title="2점">
                <label for="rating62"></label>
                <input type="checkbox" name="after" id="rating63" value="3" class="rate_radio" title="3점" >
                <label for="rating63"></label>
                <input type="checkbox" name="after" id="rating64" value="4" class="rate_radio" title="4점">
                <label for="rating64"></label>
                <input type="checkbox" name="after" id="rating65" value="5" class="rate_radio" title="5점">
                <label for="rating65"></label>
            </div>
        </div>
        		
		<br />
		의사리뷰<br />
		<textarea name="docter_review"></textarea><br /><br />
		
		병원리뷰<br />
		<textarea name="hospital_review"></textarea><br /><br />
		
		한줄평<br />
		<input type="text" name="summary" maxlength="30"><br /><br />
		
		재방문 추천<br />		
		<input type="radio" name="revisit" value="Y">YES
		<input type="radio" name="revisit" value="N">NO<br /><br />
		
		병원사진
		<input multiple="multiple" type="file" name="hospital" maxlength="3"><br /><br />
		
		치료사진
		<input multiple="multiple" type="file" name="cure" maxlength="3"><br /><br />
		
		나의 페이지에 공개<br />
		<input type="checkbox" name="public_check" value="Y">나의페이지에공개<br /><br />
		
		<input type="submit" value="확인">
	</form>
</body>
</html>