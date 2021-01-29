package pet.model.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pet.model.dto.CommentReviewDTO;
import pet.model.dto.PageDTO;
import pet.model.dto.PriceReviewDTO;
import pet.model.dto.RatingReviewDTO;
import pet.model.dto.ReviewDTO;
import pet.model.dto.UploadReviewDTO;
import pet.model.service.CommentReviewService;
import pet.model.service.PriceReviewService;
import pet.model.service.RatingReviewService;
import pet.model.service.ReviewService;
import pet.model.service.UploadReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewBean {
	
	@Autowired
	private ReviewService reviewService; 
	
	@Autowired
	private UploadReviewService uploadReviewService;
	
	@Autowired
	private CommentReviewService commentReviewService;
	
	@Autowired
	private RatingReviewService ratingReviewService;
	
	@Autowired
	private PriceReviewService priceReviewService;
	
	@RequestMapping("insertreview.do")
	public String insertReview() throws Exception {
		return "review/insertReview";
	}
	
	@RequestMapping("insertreviewpro.do")
	public String insertReviewPro(ReviewDTO reviewDTO,
			UploadReviewDTO uploadReviewDTO,
			CommentReviewDTO commentReviewDTO,
			RatingReviewDTO ratingReviewDTO,
			PriceReviewDTO priceReviewDTO,
			MultipartHttpServletRequest request) throws Exception {
		
		// 리뷰 입력
		reviewService.insertReview(reviewDTO);
		int review_no = reviewService.selectNewReview();
		
		// 다중 파일업로드
		// 파일 이름 차례대로 검색 후 이름에 맞는 파일 모두 업로드
		Iterator<String> fileTypeNames = request.getFileNames();
		while(fileTypeNames.hasNext()) {
			String fileTypeName = fileTypeNames.next();
			List<MultipartFile> mf = request.getFiles(fileTypeName);
			
			for(int i = 0; i < mf.size(); i++) {
				if(mf.get(i).isEmpty()) {
					break;
				}
				
				String fileName = mf.get(i).getOriginalFilename();				
				uploadReviewDTO.setOrg_name(fileName);
				uploadReviewDTO.setReview_no(review_no);
				int no = uploadReviewService.insertFile(uploadReviewDTO);
				String ext = fileName.substring(fileName.lastIndexOf("."));			
				String saveName = "file_"+no+ext;
				uploadReviewDTO.setNo(no);
				uploadReviewDTO.setSave_name(saveName);
				uploadReviewDTO.setFile_type(fileTypeName);
				uploadReviewService.fileUpdate(uploadReviewDTO);
				
				String savePath = request.getRealPath("save");
				File saveFile = new File(savePath+"\\"+saveName); 	
				try {
					mf.get(i).transferTo(saveFile);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		// 리뷰 코멘트 입력
		commentReviewDTO.setReview_no(review_no);
		commentReviewService.insertCommentReview(commentReviewDTO);
		
		// 리뷰 평점 평균 구하기
		int [] meanRating = {
				Integer.parseInt(ratingReviewDTO.getAfter()), 
				Integer.parseInt(ratingReviewDTO.getClean()), 
				Integer.parseInt(ratingReviewDTO.getDetail()),
				Integer.parseInt(ratingReviewDTO.getKind()),
				Integer.parseInt(ratingReviewDTO.getPrice()),
				Integer.parseInt(ratingReviewDTO.getWaiting())
		};
		
		// 총점 값
		int sumRating = 0 ;		
		// 평균 값 
		float avgRating = 0f;
		
		for (int i = 0; i < meanRating.length; i++) {
			sumRating += meanRating[i];
		}		
		avgRating = sumRating / (float) meanRating.length ;
		
		// 리뷰 평점 입력
		ratingReviewDTO.setReview_no(review_no);
		ratingReviewDTO.setMean(avgRating);
		ratingReviewService.insertRatingReview(ratingReviewDTO);
		
		// 리뷰 가격정보 입력
		String [] rePrice = priceReviewDTO.getPrice_info().split(",");
		String [] reSubject = priceReviewDTO.getSubject_info().split(",");
		
		for(int i = 0; i < rePrice.length; i++) {
			priceReviewDTO.setReview_no(review_no);
			priceReviewDTO.setPrice_info(rePrice[i]);
			priceReviewDTO.setSubject_info(reSubject[i]);			
			priceReviewService.insertPriceReview(priceReviewDTO);
		}
		
		return "review/insertReviewPro";
	}
	
	@RequestMapping("contentsreview.do")
	public String contentsReview(@ModelAttribute PageDTO pageDTO,
			@RequestParam(defaultValue ="1") int pageNum,
			ReviewDTO reviewDTO,
			RatingReviewDTO ratingReviewDTO,
			CommentReviewDTO commentReviewDTO,
			Model model) throws Exception {
		
		if(pageNum == 0) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(Integer.toString(pageNum));
		}		
		int count = reviewService.getListReviewCount(reviewDTO.getHospital_name());		
		pageDTO.setCount(count);
		pageDTO.paging(pageDTO.getPageNum(), count);
		
		int start = pageDTO.getStartRow();
		int end = pageDTO.getEndRow();
		List reviewList = reviewService.getListReview(start, end, reviewDTO.getHospital_name());		

		List ratingList = new ArrayList();
		List commentList = new ArrayList();
		List priceByNoList = new ArrayList();
		List priceList = new ArrayList();
		Map priceMap = new HashMap();
		
		for(int i=0; i < reviewList.size(); i++) {
			ratingReviewDTO = null;
			commentReviewDTO = null;
			priceByNoList = null;
			
			int review_no = ((ReviewDTO) reviewList.get(i)).getNo();
			
			ratingReviewDTO = ratingReviewService.selectByReviewNo(review_no);
			commentReviewDTO = commentReviewService.selectByReviewNo(review_no);
			priceByNoList = priceReviewService.selectByReviewNo(review_no);
			
			ratingList.add(ratingReviewDTO);
			commentList.add(commentReviewDTO);
			priceMap.put(i,priceByNoList);
			
		}
		model.addAttribute("page", pageDTO);
		model.addAttribute("ratingList", ratingList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("priceMap", priceMap);
		model.addAttribute("reviewList", reviewList);
		
		return "review/contentsReview";
	}
}
