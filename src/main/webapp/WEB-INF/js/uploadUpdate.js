$(function(){
	$('#uploadUpdateBtn').click(function(){
		let formData = new FormData($('#uploadUpdateForm')[0]);
		
		$.ajax({
			type : 'post',
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			url : '/spring/user/uploadUpdate',
			data : formData,
			success : function(data){
				alert(data);
				location.href="/spring/user/uploadList";
			},
			error : function(e){
				console.log(e);
			}
		});
	});
});