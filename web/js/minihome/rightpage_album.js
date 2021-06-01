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

document.querySelectorAll("#pageBar>a").forEach((v,i)=>{
    $(v).click((e)=>{
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