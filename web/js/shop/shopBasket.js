let contextPath=$("#contextPath").val();
let loginMemberId=$("#loginMemberId").val();

$("#presentItemBtn").click((e)=>{
    let aCheckArr=new Array();
    let bCheckArr=new Array();
    let cCheckArr=new Array();
    
    $("input[type=checkbox].aShopbasketCheck").each((i,v)=>{
        if($(v).prop("checked")) aCheckArr.push($(v).next().val());
    });
    $("input[type=checkbox].bShopbasketCheck").each((i,v)=>{
        if($(v).prop("checked")) bCheckArr.push($(v).next().val());
    });
    $("input[type=checkbox].cShopbasketCheck").each((i,v)=>{
        if($(v).prop("checked")) cCheckArr.push($(v).next().val());
    });

    let url=contextPath+"/shop/selectFriendForPresent.do?loginMemberId="+loginMemberId;
    let title="selectFriendForPresent";
    let status="width=300px,height=200px,left=500px,top=400px";

    window.open(url,title,status);

    $.ajax({
        url:"",
        type:"post",
        data:{
            "aCheckStr":aCheckArr.toString(),
            "bCheckStr":bCheckArr.toString(),
            "cCheckStr":cCheckArr.toString()
        },
        dataType:"html",
        success:(data)=>{
            $("#section").html(data);
        }
    });
});