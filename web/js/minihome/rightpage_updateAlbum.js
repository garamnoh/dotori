$("#submitPhotoBtn").click((e)=>{
    console.log("자바스크립트 테스트");
    console.log($("#upload_memberId").val());
    let formData=new FormData(document.uploadPhotoFrm);
    $.ajax({
        cache:false,
        url:contextPath+"/minihomeUploadPhoto.do",
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