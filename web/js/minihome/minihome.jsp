<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
$(()=>{
	pagesTo("Home");
	$("#backgroundMusic").children()[0].autoplay=true;
	$("#musicInfo").children()[0].style={"display":"inline"};
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
	$("#backgroundMusic").children().each((i,v)=>{
		$(v).prop("muted",!$(v).prop("muted"));
	});
}

let musicList=document.getElementById("backgroundMusic").children;
let musicInfo=document.getElementById("musicInfo").children;

const fn_pauseBackMusic=()=>{
	for(let i=0;i<musicList.length;i++){
		if(!musicList[i].paused) {
			musicList[i].pause();
		}
	}
}

const fn_replay=()=>{
	for(let i=0;i<musicList.length;i++){
		if(!musicList[i].paused) {
			musicList[i].currentTime=0;
		}
	}
}

const fn_playNext=()=>{
	for(let i=0;i<musicList.length;i++){
		if(!musicList[i].paused) {
			musicList[i].pause();
			musicList[i].currentTime=0;
			musicInfo[i].style.display="none";
			if(i==musicList.length-1){
				musicList[0].play();
				musicInfo[0].style.display="inline";
			}else{
				musicList[i+1].play();
				musicInfo[i+1].style.display="inline";
			}
			break;
		}
	}
}

const fn_playPrevious=()=>{
	for(let i=0;i<musicList.length;i++){
		if(!musicList[i].paused) {
			musicList[i].pause();
			musicList[i].currentTime=0;
			musicInfo[i].style.display="none";
			console.dir(musicInfo[i]);
			if(i==0){
				musicList[musicList.length-1].play();
				musicInfo[musicList.length-1].style.display="inline";
			}else{
				musicList[i-1].play();
				musicInfo[i-1].style.display="inline";
			}
			break;
		}
	}
}

for(let i=0;i<musicList.length;i++) {
	musicList[i].addEventListener("ended",()=>{
		musicList[i].pause();
		musicList[i].currentTime=0;
		musicInfo[i].style.display="none";
		if(i==musicList.length-1) {
			musicList[0].play();
			musicInfo[0].style.display="inline";
		}else {
			musicList[i+1].play();
			musicInfo[i+1].style.display="inline";
		}
	});
}