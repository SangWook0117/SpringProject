<%-- SpringProject/src/main/webapp/WEB-INF/user/deleteForm.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/sakura_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/delete.css">
<title>회원탈퇴</title>
</head>
<body>
<div id="write-jsp">
	<div id="right">
		<a href="/spring/">
			<img src="../image/mangom3.png" width="130" height="140" alt="mangom" />
		</a>
		<div id="container">
			<div id="delete-header">회원탈퇴</div>
			<form name="userDeleteForm" id="userDeleteForm">
				<input type="hidden" id="id" value="${id}"/>
				
				<table>
					<tbody>
					
					<tr>
					    <th class="label">비밀번호</th>
					    <td class="input">
					       <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" />
					       <div id="pwdDiv"></div>
					    </td>
					</tr>
					</tbody>
				
					<tr align="center">
				        <td colspan="2" height="20">
				            <button type="button" id="deleteBtn">회원탈퇴</button>
				        </td>
				    </tr>
			</table>
		</form>
			
		</div>
		<button type="button" id="menuBtn" onclick="location.href='/spring/user/list?pg=${pg}'">목록</button>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script type="text/javascript" src="../js/delete.js"></script>
</body>
</html>









