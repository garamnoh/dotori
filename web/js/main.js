$('body>header>.menuBox>.menu>.title').on('click', (e)=>{
    let item = $(e.target).html()
    switch(item){
        case 'Home':
            $('aside').removeClass('hide');
            $('aside>iframe').attr('src', 'sidebarMain.jsp');
            $('.content>iframe').attr('src', 'contentMain.jsp');
            break;
        case 'Friends':
            $('aside').removeClass('hide');
            $('aside>iframe').attr('src', 'sidebarFriends.jsp');
            $('.content>iframe').attr('src', 'contentFriends.jsp');
            break;
        case 'Shop':
            $('aside').removeClass('hide');
            $('aside>iframe').attr('src', 'sidebarShop.jsp');
            $('.content>iframe').attr('src', 'contentShop.jsp');
            break;
        case '':
            $('aside').addClass('hide');
            $('.content>iframe').attr('src', 'minihome/minihome.jsp');
            break;
    }
});