<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
$(()=>{
	pagesTo("Home");
});
let pageNum=0;
$("nav.miniMenu li").on("click",(e)=>{	
	$(e.target).parent().children().each((i,v)=>{
		if(v==e.target) pageNum=i;
	});
	
	switch(pageNum){
		case 0:pagesTo("Home");break;
		case 1:pagesTo("Album");break;
		case 2:pagesTo("Diary");break;
		case 3:pagesTo("Jukebox");
	}

    $(e.target).parent().children().css("background-color","skyblue");
    $(e.target).css("background-color","powderblue");
    $(e.target).parent().children().hover((i)=>{
        $(i.target).css("background-color","steelblue");
    },(i)=>{
        if(e.target==i.target){
            $(i.target).css("background-color","powderblue");
        }else{
            $(i.target).css("background-color","skyblue");
        }
    });
});

const pagesTo=(menu)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/page/minihomeLeftPageTo"+menu+".do",
		type:"post",
		dataType:"html",
		success:(data)=>{
			console.log(data);
			$("#left-page").html(data);
		}
	});
	$.ajax({
		url:"<%=request.getContextPath()%>/page/minihomeRightPageTo"+menu+".do",
		type:"post",
		dataType:"html",
		success:(data)=>{
			$("#right-page").html(data);
		}
	});
};

const fn_muteBackMusic=()=>{
	$("#backMusic").prop("muted",!$("#backMusic").prop("muted"));
}

const fn_stopBackMusic=()=>{
	let backMusic=document.getElementById("backMusic");
	if(!backMusic.paused){
		backMusic.pause();
	}else{
		backMusic.play();
	}
}