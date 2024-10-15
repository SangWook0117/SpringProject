<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/write.css">
<title>회원가입</title>
</head>
<body>
<div id="write-jsp">
	<%-- <div id="left">
		<div id="header">
			<a href="/spring/">
				<img src="../image/alarm_logo.png" alt="Alarm Logo" alt="logo" width="50" height="50" />
				HOME
			</a>
		</div>
		<div id="profile">
			<img src="${pageContext.request.contextPath}/resources/image/mangom3.png" width="140" height="140" alt="mangom" />
			<img src="../image/mangom3.png" width="140" height="140" alt="mangom" />
		</div>
		<div id="links">
			<a id="logOutBtn" href="${context }/member/memberLogOut.do">로그아웃</a> |
			<a href="#">고객센터</a> |
			<a href="#">한국어</a>
		</div>
	</div> --%>

	<div id="right">
		<a href="/spring/">
			<img src="../image/mangom3.png" width="130" height="140" alt="mangom" />
		</a>
		<div id="container">
			<div id="edit-header">회원가입</div>
				<form name="userWriteForm" id="userWriteForm">
					<table>
					<tr>
					     <th class="label">이름</th>
					     <td class="input">
					        <input type="text" name="name" id="name" placeholder="이름 입력" />
					       	<div id="nameDiv"></div>
					    </td>
					</tr>
					<tr>
					    <th class="label">아이디</th>
					    <td class="input">
					       <input type="text" name="id" id="id" placeholder="아이디 입력" />
					       <div id="idDiv"></div>
					    </td>
					</tr>
					<tr>
					    <th class="label">비밀번호</th>
					    <td class="input">
					       <input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력" />
					       <div id="pwdDiv"></div>
					    </td>
					</tr>
					<tr align="center">
				        <td colspan="2" height="20">
				            <button type="button" id="writeBtn">회원가입</button>
				            <button type="reset">초기화</button>
				        </td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script type="text/javascript" src="/spring/js/write.js"></script>
</body>
</html>





