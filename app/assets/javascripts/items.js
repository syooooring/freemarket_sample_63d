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
    asNavFor: '.thumbnail', //thumbnailクラスのナビゲーション
  });
});