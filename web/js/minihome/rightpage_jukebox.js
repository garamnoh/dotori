$("#changeBtn").click((e)=>{
    let targetFolder=$("#jukeboxChooseFolder").val();
    let album=$("#currentAlbum").val();
    let musicNoArray=new Array();
    $("#jukeboxContainer>.audio-box>input[type=checkbox]").each((i,v)=>{
        if(v.checked) musicNoArray.push($(v).next().val());
    });
    console.log(musicNoArray);
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

$("#changePlaySeqBtn").click((e)=>{
    let album=$("#currentAlbum").val();
    let seqArr=new Array();
    $(".playSeq").each((i,v)=>{
        seqArr.push($(v).next().val()+"/"+$(v).val());
    });
    $.ajax({
        url:contextPath+"/page/minihomeRightPageToJukebox.do",
        type:"post",
        data:{"hostMemberId":hostMemberId,"album":album,"seqArrStr":seqArr.toString()},
        dataType:"html",
        success:(data)=>{
            $("#right-page").html(data);
        }
    });
});