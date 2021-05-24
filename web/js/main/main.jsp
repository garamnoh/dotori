<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
let pageNum=0;
$((e)=>{
	if(pageNum==0) BoxesTo("Main");
});
$(".menu>.title").on("click",(e)=>{
	let titleElements=$(e.target).parent().children();
	for(let i=0;i<titleElements.length;i++){
		if(e.target==titleElements[i]) pageNum=i;
	}
	switch(pageNum){
		case 0:BoxesTo("Main");break;
		case 1:BoxesTo("Friends");break;
		case 2:BoxesTo("Shop");break;
		case 3:BoxesTo("Minihome");
	}
});
const BoxesTo=(title)=>{
	if(pageNum!=3){
		$(".contentsSub>aside").css("display","block");
		$.ajax({
			url:"<%=request.getContextPath()%>/page/sidebar"+title+".do",
			type:"post",
			dataType:"html",
			success:(data)=>{
				$("#sideMenuBox").html(data);
			}
		});
	}else{
		$(".contentsSub>aside").css("display","none");
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/page/content"+title+".do",
		type:"post",
		dataType:"html",
		success:(data)=>{
			$("#contentBox").html(data);
		}
	});
}