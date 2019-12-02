$(function () {
  $(".back-side__number").click(function () {
    if ($(".back-side__picture").hasClass("is-show")) { // クリックされた要素がclickedクラスだったら
      $(".back-side__picture").removeClass("is-show");
    } else {
      $(".back-side__picture").addClass("is-show");
    }
  });
  $('.card-number__input').formatter({
    'pattern': '{{9999}}-{{9999}}-{{9999}}-{{9999}}'
  });
});