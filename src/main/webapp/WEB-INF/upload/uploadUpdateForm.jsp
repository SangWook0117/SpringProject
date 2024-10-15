<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="uploadUpdateForm">
	<input type="hidden" name="seq" value="${userUploadDTO.seq }"/>
	<table border="1">
		<tr>
			<th>상품명</th>
			<td>
				<input type="text" name="imageName" size="35" value="${userUploadDTO.imageName }">
			</td>
		</tr>	
		
		<tr>
			<td colspan="2">
				<textarea name="imageContent" rows="10" cols="50">${userUploadDTO.imageContent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span id="showImageList">
					<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-113/storage/${userUploadDTO.imageFileName }" 
						alt="${userUploadDTO.imageFileName }" width="70" height="70" />
				</span>
				<img id="camera" src="../image/camera.png" width="50" height="50" alt="카메라"/>
				<input type="file" name="img" id="img" style="visibility: hidden;" />
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="수정" id="uploadUpdateBtn">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/uploadUpdate.js"></script>
<script type="text/javascript">
$('#camera').click(function(){
	$('#img').trigger('click'); //강제 이벤트 발생
});

//이미지 미리보기
$('#img').change(function(){
	$('#showImageList').empty();
	
	for(var i=0; i<this.files.length; i++){
		readURL(this.files[i]);
	}
});

function readURL(file){
	var reader = new FileReader();
	
	var show;
	reader.onload = function(e){
		var img = document.createElement('img');
        img.src = e.target.result;
        img.width = 70;
        img.height = 70;
        $('#showImageList').append(img);
	}
	
	reader.readAsDataURL(file);
}
</script>
</body>
</html>