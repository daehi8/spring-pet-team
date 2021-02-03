package pet.model.service;

import java.util.List;

import pet.model.dto.ReviewDTO;

public interface ReviewService {
	
	// 리뷰 작성
	public void insertReview(ReviewDTO reviewDTO)throws Exception;
	
	// 가장 최근의 리뷰번호 확인
	public int selectNewReview()throws Exception;
	
	// 리뷰 페이징
	public List getListReview(int start, int end, String hospital_name, String SearchType)throws Exception;
	
	// 리뷰 총 갯수 확인
	public int getListReviewCount(String hospital_name)throws Exception;
	
	// 리뷰 재방문 추천 총 갯수 확인
	public int getRecomCount(String hospital_name)throws Exception;
	
	// 리뷰 재방문 비추천 총 갯수 확인
	public int getNotRecomCount(String hospital_name)throws Exception;
	
	// 승인받아야 할 리뷰 리스트
	public List getListAuthCheckReview(int start, int end)throws Exception;
	
	// 승인 받아야 할 리스트 갯수 확인
	public int getListAuthCheckReviewCount()throws Exception;

	// 리뷰 승인
	public void okAuthCheck(int review_no)throws Exception;
	
	// 리뷰 취소
	public void noAuthCheck(int review_no)throws Exception;
	
	// 리뷰 고유번호로 리뷰 정보 확인
	public ReviewDTO selectByReviewNo(int review_no)throws Exception;
	
}
