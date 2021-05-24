$('body>.newFeed>.contents>.like').on('click', (e)=>{
    let unlike = '/dotori/images/unlike.png'
    let like = '/dotori/images/like.png'
    let src = $(e.target).attr('src');
    let newSrc = src==unlike ? like : unlike;
    $(e.target).attr('src', newSrc); 
});