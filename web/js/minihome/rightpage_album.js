$("#changeFolderBtn").click((e)=>{
    let targetPhotoNoArr=new Array();
    document.querySelectorAll("#albumBox input[type=checkbox]").forEach((v,i)=>{
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
    $.ajax({
        url:contextPath+"/page/minihomeLeftPageToAlbum.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "currentFolder":$("#currentFolder").val()
        },
        dataType:"html",
        success:(data)=>{
            $("#left-page").html(data);
        }
    });
});

var fn_openCommentBox=(event)=>{
    let commentBox=$(event.target).parent().parent().next();
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
            "commentContent":commentContent,
            "folder":$("#currentFolder").val()
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

$(".modifyPhotoBtn").click((e)=>{
    let imgNo=$(e.target).next();
    let folder=imgNo.next();
    let title=folder.next();
    let hashTag=title.next();
    let content=hashTag.next();
    let filepath=content.next();
    $.ajax({
        url:contextPath+"/page/minihomeRightPageToUpdateAlbum.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "loginMemberId":loginMemberId,
            "imgNo":imgNo.val(),
            "folder":folder.val(),
            "title":title.val(),
            "hashTag":hashTag.val(),
            "content":content.val(),
            "filepath":filepath.val()
        },
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
});

$(".deletePhotoBtn").click((e)=>{
    let deleteTargetImgNo=$(e.target).next().val();
    $.ajax({
        url:contextPath+"/page/minihomeRightPageToAlbum.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "folder":$("#currentFolder").val(),
            "deleteTargetImgNo":deleteTargetImgNo
        },
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
});

var fn_insertRecomment=(event)=>{
    console.dir($(event.target).next().attr("class"));
    let recommentBox=$(event.target).next();
    if(recommentBox.css("display")=="none"){
        recommentBox.css("display","block");
    }else{
        recommentBox.css("display","none");
    }
}

var fn_selectProfileImg=(event)=>{
    let checkedArr=new Array();
    let profileImgTarget="";
    $(".buttonsInPhotoBox>input[type=checkbox]").each((i,v)=>{
        if($(v).prop("checked")) checkedArr.push($(v).next().val());
    });
    if(checkedArr.length==1) profileImgTarget=checkedArr[0];
    $.ajax({
        url:contextPath+"/page/minihomeRightPageToAlbum.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "folder":$("#currentFolder").val(),
            "profileImgTarget":profileImgTarget
        },
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
};

$(".photoLoveBox>.photoLoveImg").click((e)=>{
    let currentHeartSrc=$(e.target).attr("src");
    if(currentHeartSrc==contextPath+"/images/minihome/love_white.png") {
        $(e.target).attr("src",contextPath+"/images/minihome/love_red.png");
        $.ajax({
            url:contextPath+"/ajax/albumLike.do",
            type:"post",
            data:{
                "loginMemberId":loginMemberId,
                "likeImgTarget":$(e.target).next().val()
            },
            dataType:"json",
            success:(data)=>{
                console.log("data테스트 : "+data["likeNum"]);
                $(e.target).next().next().text(data["likeNum"]);
            }
        });
    }else{
        $(e.target).attr("src",contextPath+"/images/minihome/love_white.png");
        $.ajax({
            url:contextPath+"/ajax/albumLike.do",
            type:"post",
            data:{
                "loginMemberId":loginMemberId,
                "unlikeImgTarget":$(e.target).next().val()
            },
            dataType:"json",
            success:(data)=>{
                console.log("data테스트 : "+data["likeNum"]);
                $(e.target).next().next().text(data["likeNum"]);
            }
        });
    }
});