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

var fn_openCommentBox=(event)=>{
	console.log("test");
    let commentBox=$(event.target).parent().next();
    if(commentBox.css("display")=="none") {
        commentBox.css("display","block");
    }else {
        commentBox.css("display","none");
    }
};

var fn_insertComment=(event)=>{
    let albumRef=$(event.target).next().val();
    let albumCommentRef=$(event.target).next().next().val();
    let commentLevel=$(event.target).next().next().next().val();
    let commentContent=$(event.target).prev().val();
    $.ajax({
        url:contextPath+"/page/minihomeRightPageToAlbum.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "loginMemberId":loginMemberId,
            "albumRef":albumRef,
            "albumCommentRef":albumCommentRef,
            "commentLevel":commentLevel,
            "commentContent":commentContent
        },
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
}

document.querySelectorAll("#pageBar>a").forEach((v,i)=>{
    $(v).click((e)=>{
        console.log($("#currentFolder").val());
        let strArr=v.id.split("/");
        let cPage=strArr[0];
        let numPerPage=strArr[1];
        console.log(cPage,numPerPage);
        $.ajax({
            url:contextPath+"/page/minihomeRightPageToAlbum.do",
            type:"post",
            data:{
                "hostMemberId":hostMemberId,
                "folder":$("#currentFolder").val(),
                "cPage":cPage,
                "numPerPage":numPerPage
            },
            dataType:"html",
            success:(data)=>{
                $("#right-page").html(data);
            }
        });
    });
});