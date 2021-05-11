$('.menuOption>.menuTitle').on('click', (e)=>{
    $(e.target).next().slideToggle();
    $('.menuOption>.menuTitle').not($(e.target)).next().slideUp();
});