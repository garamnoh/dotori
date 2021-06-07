$("#submitPhotoBtn").click((e)=>{
    let formData=new FormData(document.uploadPhotoFrm);
    $.ajax({
        cache:false,
        url:contextPath+"/minihomeUploadPhoto.do?hostMemberId="+hostMemberId,
        processData:false,
        contentType:false,
        type:"post",
        data:formData,
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
});