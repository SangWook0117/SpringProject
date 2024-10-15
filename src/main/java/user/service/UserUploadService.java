package user.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import user.bean.UserUploadDTO;

public interface UserUploadService {

	public void upload(List<UserUploadDTO> imageUploadList);

	public List<UserUploadDTO> uploadList();

	public UserUploadDTO getUploadDTO(String seq);

	public void uploadUpdate(UserUploadDTO userUploadDTO, MultipartFile img);

	public void uploadDelete(Integer seq);
	
}
