<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td rowspan="3"><img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-113/storage/${userUploadDTO.imageFileName }" 
								alt="${userUploadDTO.imageFileName }" width="200" height="200"/></td>
			<td width="250" style="text-indent: 5px;">번호 : ${userUploadDTO.seq }</td>
		</tr>
		<tr>
			<td>상품명 : ${userUploadDTO.imageName }</td>
		</tr>
		<tr>
			<td>파일명 : ${userUploadDTO.imageOriginalFileName }</td>
		</tr>
		<tr>
			<td colspan="2" height="200" valign="top"><pre>${userUploadDTO.imageContent }</pre></td>
		</tr>
	</table>
	<div style="margin-top: 5px;">
	<input type="button" value="목록" onclick="location.href='/spring/user/uploadList'"/>
	<input type="button" value="수정" onclick="location.href='/spring/user/uploadUpdateForm?seq=${userUploadDTO.seq}'"/>
	</div>
</body>
</html>