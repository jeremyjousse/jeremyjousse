function initSkrollr()
{

  var animDone = false;

  skrollr.init({
      forceHeight: false,
      smoothScrolling: false,
      // mobileCheck: function () {
      //     //hack - forces mobile version to be off
      //     return false;
      // },
      // /* easing: 'swing', */
      render: function () {
          if ($('header').hasClass('skrollable-after')) {
              if (!animDone) {

                  animDone = true;
                  $('header').addClass('fixed-header').css({
                      'display': 'none'
                  }).fadeIn(300);

              }

          } else {

              animDone = false;
              $('header').removeClass('fixed-header');

          }

      }
  });
}

$(function() {
  // var header = ;
  initSkrollr();

  if ($('.map').length) {

      googleMap();

  }
});
