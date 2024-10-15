package user.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import user.bean.UserUploadDTO;
import user.dao.UserUploadDAO;
import user.service.ObjectStorageService;
import user.service.UserUploadService;

@Service
public class UserUploadServiceImpl implements UserUploadService {

	@Autowired
	private UserUploadDAO userUploadDAO;
	@Autowired
	private ObjectStorageService objectStorageService;
	@Autowired
	private HttpSession session;
	
	private String bucketName = "bitcamp-9th-bucket-113";
	
	@Override
	public void upload(List<UserUploadDTO> imageUploadList) {
		userUploadDAO.upload(imageUploadList);
	}

	@Override
	public List<UserUploadDTO> uploadList() {
		return userUploadDAO.uploadList();
	}

	@Override
	public UserUploadDTO getUploadDTO(String seq) {
		return userUploadDAO.getUploadDTO(seq);
	}

	@Override
	public void uploadUpdate(UserUploadDTO userUploadDTO, MultipartFile img) {
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		System.out.println(img);
		
		UserUploadDTO dto = userUploadDAO.getUploadDTO(userUploadDTO.getSeq()+"");// 기존 DB에 보관된 1개의 정보
		String imageFileName;
		if(img.getSize() != 0) { // 업데이트폼에서 새로운 이미지를 올렸을 때
			//Object Storage(NCP)는 이미지를 덮어쓰지 않는다.
			//DB에서 seq에 해당하는 imageFileName을 꺼내와서 Object Storage(NCP)의 이미지를 삭제하고,
			//새로운 이미지를 올린다.
			imageFileName = dto.getImageFileName();
			System.out.println("imageFileName = " + imageFileName);
			
			//Object Storage(NCP)는 이미지 삭제
			objectStorageService.deleteFile(bucketName, "storage/", imageFileName);
			
			//Object Storage(NCP)는 새로운 이미지 올리기
			imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
			
			String imageOriginalFileName = img.getOriginalFilename();
			File file = new File(filePath, imageOriginalFileName);
			
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			userUploadDTO.setImageFileName(imageFileName);
			userUploadDTO.setImageOriginalFileName(imageOriginalFileName);
		} else { // 업데이트폼에서 이미지를 수정하지 않았을 때
			userUploadDTO.setImageFileName(dto.getImageFileName());
			userUploadDTO.setImageOriginalFileName(dto.getImageOriginalFileName());
		}
		//DB
		userUploadDAO.uploadUpdate(userUploadDTO);
	}

	@Override
	public void uploadDelete(Integer seq) {
		String imageFileName = userUploadDAO.getImageFileName(seq);
		System.out.println("imageFileName = " + imageFileName);
		
		//Object Storage(NCP)는 이미지 삭제
		objectStorageService.deleteFile(bucketName, "storage/", imageFileName);
		
		userUploadDAO.uploadDelete(seq);
	}

}
