$(document).on('turbolinks:load', function () {
  $('.slick').slick({
    autoplay: true,
    dots: true,
    prevArrow: '<img src="https://icon-pit.com/wp-content/uploads/2018/10/arrow_icon_414-300x300.png" class="slide-arrow prev-arrow", width="31", height="46">',
    nextArrow: '<img src="https://icon-pit.com/wp-content/uploads/2018/10/arrow_icon_414-300x300.png" class="slide-arrow next-arrow", width="31", height="46">'
  });
});


$(document).ready(function() {
  //キーボードイベント
  $(".input-default").keyup(function() {
       //.input-defaultに入力した内容が.passboxに反映される
      $(".passbox").html($(this).val());
  });
  //クリックイベント
  $(".checkbox-default").change(function() {
      //反映箇所の表示/非表示スイッチ
      $(".passbox").toggle();
  });
});