let columnLength=14;
let rowLength=14;
let signalTable=$("<table>");
let colorStr=$("#colorStrVal").val();
let colorTrArr=colorStr.split("&");

for(let j=0;j<rowLength;j++) {
    let signalTr=$("<tr>");
    let colorTdArr=colorTrArr[j].split("^");
    for(let i=0;i<columnLength;i++) {
        let signalTd=$("<td>");
        signalTd.css("width","20px");
        signalTd.css("height","20px");
        signalTd.css("background-color",colorTdArr[i]);
        signalTr.append(signalTd);
    }
    signalTable.append(signalTr);
}

$("#drawing-signal-box").append(signalTable);

$("#drawing-signal-box td").click((e)=>{
    $(e.target).css("background-color",$("#color-selector").val());
    
    let colorStr="";
    $("#drawing-signal-box tr").each((i,v)=>{
        for(let j=0;j<$(v).children().length;j++) {
            if(j==$(v).children().length-1) {
                colorStr+=$($(v).children()[j]).css("background-color");
            }else{
                console.log($(v).children()[j]);
                colorStr+=$($(v).children()[j]).css("background-color")+"^";
            }
        }
        if(i!=$(v).children().length-1) colorStr+="&";
    });
    console.log(colorStr);
    
    $.ajax({
        url:contextPath+"/ajax/drawingSignal.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "colorStr":colorStr
        },
        dataType:"json",
        success:(data)=>{
            console.log(data["colorStr"]);
        }
    });
});

$("input#resetAllColor").click((e)=>{
    $("#drawing-signal-box td").each((i,v)=>{
        $(v).css("background-color",$("#color-selector").val());
    });

    let colorStr="";
    $("#drawing-signal-box tr").each((i,v)=>{
        for(let j=0;j<$(v).children().length;j++) {
            if(j==$(v).children().length-1) {
                colorStr+=$($(v).children()[j]).css("background-color");
            }else{
                console.log($(v).children()[j]);
                colorStr+=$($(v).children()[j]).css("background-color")+"^";
            }
        }
        if(i!=$(v).children().length-1) colorStr+="&";
    });
    console.log(colorStr);
    
    $.ajax({
        url:contextPath+"/ajax/drawingSignal.do",
        type:"post",
        data:{
            "hostMemberId":hostMemberId,
            "colorStr":colorStr
        },
        dataType:"json",
        success:(data)=>{
            console.log(data["colorStr"]);
        }
    });
});
