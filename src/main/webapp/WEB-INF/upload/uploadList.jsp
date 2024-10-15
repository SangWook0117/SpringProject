<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}
th, td {
	padding: 5px;
}
</style>
</head>
<body>
<form id="uploadListForm">
	<table border="1" frame="hsides" rules="rows">
		<tr>
			<th><input type="checkbox" id="allCheck"><label for="allCheck">전체선택</label></th>
			<th>번호</th>
			<th>이미지</th>
			<th>상품명</th>
		</tr>
		<c:forEach var="userUploadDTO" items="${list }">
		<tr>
			<td align="center"><input type="checkbox" name="check" value="${userUploadDTO.seq }"></td>
			<td>
				<input type="hidden" name="seq" value="${userUploadDTO.seq }"/>
				${userUploadDTO.seq }
			</td>
			<td>
				<%-- <img src="http://localhost:8080/spring/storage/${userUploadDTO.imageOriginalFileName }" alt="userUploadDTO.imageName" width="50" height="50"/> --%>
				<a href="/spring/user/uploadView?seq=${userUploadDTO.seq }">
					<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-113/storage/${userUploadDTO.imageFileName }" alt="userUploadDTO.imageName" width="50" height="50"/>
				</a>
			</td>
			<td>${userUploadDTO.imageContent }</td>
		</tr>
		</c:forEach>
		<tr>
			<th colspan="4">
				<input type="button" value="선택삭제" id="deleteBtn">
			</th>
		</tr>
	</table>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#allCheck').click(function(){
		if($('#allCheck').is(':checked'))
			$('input[name=check]').prop('checked', true);
		else
			$('input[name=check]').prop('checked', false);
	});// 전체선택
	$('input[name=check]').click(function(){
		let total = $('input[name=check]').length; // 체크박스의 개수
		let checked = $('input[name=check]:checked').length; // 체크박스에 체크가 된것의 개수
		
		if(total != checked) $('#allCheck').prop('checked', false);
		//$('#allCheck').prop('checked', $('input[name=check]').length == $('input[name=check]:checked').length)
		else $('#allCheck').prop('checked', true);
	}); //개별선택
	//선택삭제
	$('#deleteBtn').click(function(){
		let selectedSeqs = [];

	    // 체크된 항목들의 seq 값을 수집
	    $('input[name=check]:checked').each(function(){
	        let seq = $(this).closest('tr').find('input[name=seq]').val();
	        selectedSeqs.push(seq);
	    });

	    if(selectedSeqs.length === 0) {
	        alert("선택된 항목이 없습니다.");
	        return;
	    }
	    
	    $.ajax({
	    	type : 'post',
	    	url : '/spring/user/uploadDelete',
	    	traditional: true,
	    	data : { 'seqs[]' : selectedSeqs },
	    	//data : $('#uploadListForm').serialize(), 하면 체크된 항목만 서버로 간다. checkbox 자체에 value값으로 시퀀스값을 주면됨
	    	success : function(){
	    		alert('삭제완료');
	    		location.href = '/spring/user/uploadList';
	    	},
	    	error : function(e){
	    		console.log(e);
	    	}
	    });
		
	});
	//http://localhost8080:/spring/user/uploadList?check=27&check=28&check=29
});
</script>
</body>
</html>