package user.service;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserService {
	
	public String getExistId(String id);

	public void write(UserDTO userDTO);

	public Map<String, Object> list(String pg);

	public UserDTO getUser(String id);

	public void update(UserDTO userDTO);
	
	public UserDTO getExistPwd(String id);

	public void delete(String id);
	
}
















