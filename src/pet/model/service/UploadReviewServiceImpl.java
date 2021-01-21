package pet.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pet.model.dto.UploadReviewDTO;

@Service("uploadReviewService")
public class UploadReviewServiceImpl implements UploadReviewService{
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public int insertFile(UploadReviewDTO uploadReviewDTO) throws Exception {
		dao.insert("uploadReview.insertFile", uploadReviewDTO);
		return dao.selectOne("uploadReview.selectCount");
	}

	@Override
	public UploadReviewDTO selectFile(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void fileUpdate(UploadReviewDTO uploadReviewDTO) throws Exception {
		dao.update("uploadReview.updateFile", uploadReviewDTO);
		
	}

	@Override
	public void deleteFile(int no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List selectFileNo(int review_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
