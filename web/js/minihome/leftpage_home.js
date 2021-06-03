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
    console.log("버튼 체크");
    let profileContent=document.getElementById("profileContent").value;
    console.log(profileContent);
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