package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	public UserDTO getExistId(String id);

	public void write(UserDTO userDTO);

	public List<UserDTO> list(Map<String, Integer> map);

	public int getTotalA();

	public UserDTO getUser(String id);

	public void update(UserDTO userDTO);

	public UserDTO getExistPwd(String id);
	
	public void delete(String id);

}

















