$(document).on('turbolinks:load', function () {
  $('.slick').slick({
    autoplay: true,
    dots: true,
    prevArrow: '<img src="https://icon-pit.com/wp-content/uploads/2018/10/arrow_icon_414-300x300.png" class="slide-arrow prev-arrow", width="31", height="46">',
    nextArrow: '<img src="https://icon-pit.com/wp-content/uploads/2018/10/arrow_icon_414-300x300.png" class="slide-arrow next-arrow", width="31", height="46">'
  });
});