<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
$('body>header>.menuBox>.menu>.title').on('click', (e)=>{
    let item = $(e.target).html()
    switch(item){
        case 'Home':
            //$('aside').removeClass('hide');
            //$('aside>iframe').attr('src', 'sidebarMain.jsp');
            //$('.content>iframe').attr('src', 'contentMain.jsp');
            location.assign("<%=request.getContextPath()%>/pageToHome.do");
            break;
        case 'Friends':
            //$('aside').removeClass('hide');
            //$('aside>iframe').attr('src', 'sidebarFriends.jsp');
            //$('.content>iframe').attr('src', 'contentFriends.jsp');
            location.assign("<%=request.getContextPath()%>/pageToFriends.do");
            break;
        case 'Shop':
            //$('aside').removeClass('hide');
            //$('aside>iframe').attr('src', 'sidebarShop.jsp');
            //$('.content>iframe').attr('src', 'contentShop.jsp');
            location.assign("<%=request.getContextPath()%>/pageToShop.do");
            break;
        case '':
            $('aside').addClass('hide');
            //$('.content>iframe').attr('src', 'minihome/minihome.jsp');
            location.assign("<%=request.getContextPath()%>/pageToMini.do");
            break;
    }
});