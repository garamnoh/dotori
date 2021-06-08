$("#selectFeeling").change((e)=>{
	let changeFeeling=$(e.target).val();
    $.ajax({
        url:contextPath+"/page/minihomeLeftPageToHome.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "changeFeeling":changeFeeling
        },
        dataType:"html",
        success:(data)=>{
            $("#left-page").html(data);
        }
    });
});

$("#updateProfileContentBtn").click((e)=>{
    let profileContent=document.getElementById("updateProfileContent").value;
    $.ajax({
        url:contextPath+"/page/minihomeLeftPageToHome.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "profileContent":profileContent
        },
        dataType:"html",
        success:(data)=>{
            $("#left-page").html(data);
        }
    });
});

$("#showWriteProfileBoxBtn").click((e)=>{
    let writeBtn=$(e.target).next();
    let writeBox=$(e.target).parent().prev();
    let contentBox=writeBox.prev();
    if(writeBtn.css("display")=="none") writeBtn.css("display","block");
    else writeBtn.css("display","none");
    if(writeBox.css("display")=="none") writeBox.css("display","block");
    else writeBox.css("display","none");
    if(contentBox.css("display")=="none") contentBox.css("display","block");
    else contentBox.css("display","none");
    if($(e.target).css("display")=="none") $(e.target).css("display","block");
    else $(e.target).css("display","none");
});

$("#changeSkinBtn").click((e)=>{
    let changeSkinItemNo=$("#changeSkin").val();
    location.replace(contextPath+"/page/minihome.do?hostMemberId="+hostMemberId+"&changeSkinItemNo="+changeSkinItemNo);
});