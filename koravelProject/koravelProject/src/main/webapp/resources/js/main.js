// $('.icons').bxSlider({
//     auto: true,
//     speed: 500,
//     pause: 4000,
//     mode:'horizontal',
//     autoControls: true,
//     pager: true,
//     pagerType: 'short'
// });     
  
// 초당 자동넘김 이미지 슬라이드 이벤트

$('.post-wrapper').slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 2200,
});

// tab메뉴 hover 시 아이콘 살짝 올라가는 이벤트 구현
//   $('.tab').hover(function(){
//     $('.tab').animate('top',100);
//   });

// $('.post-wrapper').slick({
//     infinite: true,
//     slidesToShow: 3,
//     slidesToScroll: 1,
//     dots:true
//   });


/* Demo purposes only */
var snippet = [].slice.call(document.querySelectorAll('.hover'));
if (snippet.length) {
  snippet.forEach(function (snippet) {
    snippet.addEventListener('mouseout', function (event) {
      if (event.target.parentNode.tagName === 'figure') {
        event.target.parentNode.classList.remove('hover')
      } else {
        event.target.parentNode.classList.remove('hover')
      }
    });
  });
}

// video 전체화면
var elem = document.getElementById("intro_vd");
if (elem.requestFullscreen) {
        elem.requestFullscreen();
        } else if (elem.mozRequestFullScreen) {
          elem.mozRequestFullScreen();
        } else if (elem.webkitRequestFullscreen) {
          elem.webkitRequestFullscreen();
        }

