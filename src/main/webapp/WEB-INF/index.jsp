<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>*** 메인화면 ***</h2>
<h3>
	<p><a href="http://localhost:8080/spring/user/writeForm">입력</a></p>
	<p><a href="/spring/user/list">출력</a></p> <!-- pg=1 일때는 생략 가능 -->
	<br>
	<p><a href="/spring/user/uploadForm">파일 업로드</a></p>
	<p><a href="/spring/user/uploadAJaxForm">파일 업로드 AJax</a></p>
	<br>
	<p><a href="/spring/user/uploadList">이미지 출력</a></p>
</h3>
</body>
</html>

<!-- 
Spring Framework + Maven + MySQL + MyBatis(@Mapper 사용) + JSP(jQuery) + NCP

Project : SpringProject
	src/main/java	
		spring.conf
			SpringConfiguration.java
			NaverConfiguration.java
			
		com.controller.SpringProject
			MainController.java

		user.controller
			UserController.java
			UserUploadController.java

		user.service
			UserService.java (Interface)
			UserUploadService.java (Interface)
			ObjectStorageService.java (Interface)
			
		user.service.impl
			UserServiceImpl.java
			NCPObjectStorageService.java
			
		user.dao
			UserDAO.java (Interface)
			
		user.dao.impl
			UserMybatisDAO.java =====> 제거
			
		user.bean
			UserDTO.java
			UserPaging.java

	src/main/resources
		mapper
		spring
			db.properties
			mybatis-config.xml ====> 제거
	
	src/main/webapp
		WEB-INF
			css
				write.css
			js
				write.js
			image
				*.jpg
				
			storage (가상주소, 업로드)
			
			user
			
			upload
				uploadForm.jsp
			spring
				appServlet
					servlet.context.xml (웹과 관련된 WAC) web application context
				root-context.xml (웹관 독립된 WAC)
 -->















