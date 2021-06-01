$("#changeFolderBtn").click((e)=>{
    let targetPhotoNoArr=new Array();
    document.querySelectorAll("#albumBox>input[type=checkbox]").forEach((v,i)=>{
        if(v.checked) targetPhotoNoArr.push($(v).next().val());
    });

    console.log(targetPhotoNoArr.toString());

    $.ajax({
        url:contextPath+"/page/minihomeRightPageToAlbum.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "folder":$("#currentFolder").val(),
            "changeFolderTarget":$("#changeFolderTarget").val(),
            "targetPhotoStr":targetPhotoNoArr.toString()
        },
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
});

const fn_openCommentBox=(event)=>{
    let commentBox=$(event.target).parent().next();
    if(commentBox.css("display")=="none") {
        commentBox.css("display","block");
    }else {
        commentBox.css("display","none");
    }
};