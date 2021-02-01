<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>상단 병원 이미지</div>

<div>의사프로필 병원주소 등 간단하게 요약</div>

<div>의사 정보</div>

<div>병원 정보</div>

<div>
	<p>리뷰 개수 : ${count}</p>
	<p>리뷰평점 평균 : ${meanRatingResult}</p>
	<p>
		재방문 추천 : ${recomCount}
		재방문 비추천 : ${notRecomCount}
	</p>
	<p>
		청결 : ${meanCleanRating}
		가격 : ${meanPriceRating}
		친절 : ${meanKindRating}
		대기시간 : ${meanWaitingRating}
		설명 : ${meanDetailRating}
		결과 : ${meanAfterRating}
	</p>
</div>
<div>키워드검색</div>

<div>정렬</div>
<c:forEach var="reviewList" items="${reviewList}" varStatus="status">
	<div>
		<div>
			<div><h4>회원정보 : ${reviewList.member_email}</h4></div>
			<div>
				<div>별점 평균 : ${ratingList[status.index].mean}</div>
				<div>재방문 추천 : ${reviewList.revisit}</div>
			</div>
			<div>
				<p>별점</p>
				친절 : ${ratingList[status.index].kind}
				대기시간 : ${ratingList[status.index].waiting}
				청결 : ${ratingList[status.index].clean}
				설명 : ${ratingList[status.index].detail}
				가격 : ${ratingList[status.index].price}
				결과 : ${ratingList[status.index].after}
			</div>
		</div>
		<div>
			<div>등록일 : ${reviewList.reg_date}</div>
			<div>한줄평 : ${commentList[status.index].summary}</div>
			<div>
				의사 리뷰 : ${commentList[status.index].docter_review}
				병원 리뷰 : ${commentList[status.index].hospital_review}
			</div>
			<div>
				<p>가격정보</p>
				<c:forEach var="priceMap" items="${priceMap[status.index]}">
					진료과목 : ${priceMap.subject_info}
					가격  : ${priceMap.price_info}
					<br>
				</c:forEach>
			</div>
			<div>신고 및 좋아요</div>
		</div>
	</div>
</c:forEach>
</body>
</html>