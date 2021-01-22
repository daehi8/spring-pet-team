package pet.model.service;

import pet.model.dto.ReviewDTO;

public interface ReviewService {
	
	// 리뷰 작성
	public void insertReview(ReviewDTO reviewDTO)throws Exception;
	
	// 리뷰 수정
	public void updateReview(ReviewDTO reviewDTO)throws Exception;
	
	// 리뷰 삭제
	public void deleteReview(ReviewDTO reviewDTO)throws Exception;
	
	// 리뷰 작성 정보 확인
	public ReviewDTO myReview(String member_email)throws Exception;
	
	// 가장 최근의 리뷰번호 확인
	public int selectNewReview()throws Exception;
}