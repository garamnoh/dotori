$("#changeSkinBtn").click((e)=>{
    console.log("test");
    let changeSkinItemNo=$("#changeSkin").val();
    location.replace(contextPath+"/page/minihome.do?hostMemberId="+hostMemberId+"&changeSkinItemNo="+changeSkinItemNo);
});