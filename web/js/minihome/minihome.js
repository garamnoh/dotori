let contextPath=$("#contextPath").val();
let loginMemberId=$("#loginMemberId").val();
let hostMemberId=$("#hostMemberId").val();

$(()=>{
	pagesTo("Home");
	$("nav.miniMenu li:first-of-type").removeClass("unselected").addClass("selected");
	$("#backgroundMusic").children()[0].autoplay=true;
	$("#musicInfo").children()[0].style={"display":"inline"};
});
let pageNum=0;
$("nav.miniMenu li").on("click",(e)=>{	
	$(e.target).parent().children().each((i,v)=>{
		$(v).removeClass("selected").addClass("unselected");
		if(v==e.target) pageNum=i;
	});
	
	switch(pageNum){
		case 0:pagesTo("Home");break;
		case 1:pagesTo("Album");break;
		case 2:pagesTo("Diary");break;
		case 3:pagesTo("Jukebox");
	}

	$(e.target).removeClass("unselected").addClass("selected");
});

const pagesTo=(menu)=>{
	$.ajax({
		url:contextPath+"/page/minihomeLeftPageTo"+menu+".do?hostMemberId="+hostMemberId,
		type:"post",
		dataType:"html",
		success:(data)=>{
			$("#left-page").html(data);
		}
	});
	$.ajax({
		url:contextPath+"/page/minihomeRightPageTo"+menu+".do?hostMemberId="+hostMemberId,
		type:"post",
		data:{"album":"배경음악"},
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
};

let musicList=document.getElementById("backgroundMusic").children;
let musicInfo=document.querySelectorAll("#musicInfo>span");
let audioNo=0;
const checkCurrentAudio=()=>{
	for(let i=0;i<musicInfo.length;i++) {
		if(musicInfo[i].style.display!="none") {
			audioNo=window.parseInt($(musicInfo[i]).next().val());
			break;
		}
	}
}

const fn_pauseBackMusic=()=>{
	checkCurrentAudio();
	if(!musicList[audioNo].paused) {
		musicList[audioNo].pause();
	}else{
		musicList[audioNo].play();
	}
};

const fn_replay=()=>{
	checkCurrentAudio();
	musicList[audioNo].currentTime=0;
	if(musicList[audioNo].paused) {
		musicList[audioNo].play();
	}
};

const fn_playNext=()=>{
	checkCurrentAudio();
	musicList[audioNo].currentTime=0;
	musicList[audioNo].pause();
	musicInfo[audioNo].style.display="none";
	if(audioNo!=musicList.length-1) {
		musicList[audioNo+1].play();
		musicInfo[audioNo+1].style.display="inline";
	}else{
		musicList[0].play();
		musicInfo[0].style.display="inline";
	}
	
};

const fn_playPrevious=()=>{
	checkCurrentAudio();
	musicList[audioNo].currentTime=0;
	musicList[audioNo].pause();
	musicInfo[audioNo].style.display="none";
	if(audioNo!=0) {
		musicList[audioNo-1].play();
		musicInfo[audioNo-1].style.display="inline";
	}else{
		musicList[musicList.length-1].play();
		musicInfo[musicList.length-1].style.display="inline";
	}
};

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

var fn_weather=()=>{
	$.getJSON("http://api.openweathermap.org/data/2.5/weather?id=1835848&appid=73edd4b639013a97891b5aa23d7d5d0d&units=metric",function(data){
		$("#weather_main").text("날씨 : "+data.weather[0].main);
		$("#weather_icon").attr("src","http://openweathermap.org/img/wn/"+data.weather[0].icon+"@2x.png");
		$("#temp").text("현재 : "+data.main.temp);
		$("#temp_max").text("최고 : "+data.main.temp_max);
		$("#temp_min").text("최저 : "+data.main.temp_min);
	});
} 

window.setTimeout(fn_weather,0);
window.setInterval(fn_weather,60000);

$("#playMusic").hover((e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/play_hover-icon.png");
},(e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/play-icon.png");
});


$("#pauseMusic").hover((e)=>{
		$(e.target).attr("src",contextPath+"/images/minihome/pause_hover-icon.png");
},(e)=>{
		$(e.target).attr("src",contextPath+"/images/minihome/pause-icon.png");
});

$("#replayMusic").hover((e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/replay_hover-icon.png");
},(e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/replay-icon.png");
});

$("#playNextMusic").hover((e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/playNext_hover-icon.png");
},(e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/playNext-icon.png");
});

$("#playPreviousMusic").hover((e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/playPrevious_hover-icon.png");
},(e)=>{
    $(e.target).attr("src",contextPath+"/images/minihome/playPrevious-icon.png");
});

$("#muteMusic").hover((e)=>{
	$(e.target).attr("src",contextPath+"/images/minihome/mute_hover-icon.png");
},(e)=>{
	$(e.target).attr("src",contextPath+"/images/minihome/mute-icon.png");
});