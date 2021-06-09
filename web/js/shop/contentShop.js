$('div#shopTopTap>.TopTap').on('click',(e)=>{
    //let tap=$(e.target).html();
   
    $(e.target).parent().children().css("color","black");
    $(e.target).css("color","orange");
    $(e.target).parent().children().hover((i)=>{
        $(i.target).css("color","orange");
    },(i)=>{ //클릭하면
        if(e.target==i.target){
            $(i.target).css("color","orange");
        }else{
            $(i.target).css("color","black");
        }
        
    });
});





