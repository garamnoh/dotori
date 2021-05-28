$("nav.miniMenu li").on("click",(e)=>{
    let menu=$(e.target).html();
    let frameChange=(leftpageUrl,rightpageUrl)=>{
        $("iframe.left-page-frame").attr("src",leftpageUrl);
        $("iframe.right-page-frame").attr("src",rightpageUrl);
    }
    switch(menu){
        case "홈":frameChange("/views/minihome/leftpage_home.jsp","/views/minihome/rightpage_home.jsp");break;
        case "다이어리":frameChange("/views/minihome/leftpage_diary.jsp","/views/minihome/rightpage_diary.jsp");break;
        case "쥬크박스":frameChange("/views/minihome/leftpage_jukebox.jsp","/views/minihome/rightpage_jukebox.jsp");break;
        case "사진첩":frameChange("/views/minihome/leftpage_album.jsp","/views/minihome/rightpage_album.jsp");break;
        case "방명록":frameChange("/views/minihome/leftpage_board.jsp","/views/minihome/rightpage_board.jsp");
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

const fn_stopBackMusic=()=>{
	$("#backMusic").prop("muted",true);
}