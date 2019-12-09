$(document).on('turbolinks:load', function () {
  $('.slick').slick({
    autoplay: true,
    dots: true,
    prevArrow: '<img src="https://icon-pit.com/wp-content/uploads/2018/10/arrow_icon_414-300x300.png" class="slide-arrow prev-arrow", width="31", height="46">',
    nextArrow: '<img src="https://icon-pit.com/wp-content/uploads/2018/10/arrow_icon_414-300x300.png" class="slide-arrow next-arrow", width="31", height="46">'
  });

  $('.thumbnail').slick({
    infinite: true, //スライドのループ有効化
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    draggable: false //ドラッグ操作の無効化
  });
  $('.thumbnail-thumb').slick({
    infinite: true, //スライドのループ有効化
    slidesToShow: 5, //表示するスライドの数
    // rows: 2,
    // slidesPerRow:5,
    focusOnSelect: true, //フォーカスの有効化
    draggable: true,
    asNavFor: '.thumbnail' //thumbnailクラスのナビゲーション
  });
});

$(document).ready(function() {
  //キーボードイベント
  $(".input-defaultx").keyup(function() {
       //.input-defaultに入力した内容が.passboxに反映される
      $(".passbox").html($(this).val());
  });
  //クリックイベント
  $(".checkbox-default").change(function() {
      //反映箇所の表示/非表示スイッチ
      $(".passbox").toggle();
  });
});