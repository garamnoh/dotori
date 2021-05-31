$("#changeBtn").click((e)=>{
    let targetFolder=$("#chooseFolder").val();
    let album=$("#currentAlbum").val();
    let musicNoArray=new Array();
    $("#jukeboxContainer>input[type=checkbox]").each((i,v)=>{
        if(v.checked) musicNoArray.push($(v).next().val());
    });
    console.log("test"+musicNoArray.toString());
    $.ajax({
        url:contextPath+"/page/minihomeRightPageToJukebox.do",
        type:"post",
        data:{"hostMemberId":hostMemberId,"album":album,"musicNoArray":musicNoArray.toString(),"targetFolder":targetFolder},
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
});