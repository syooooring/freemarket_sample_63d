$(function () {
  let tabs = $(".tab__info");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active")
    $(".show").removeClass("show");
    const index = tabs.index(this);
    $(".right__down__main").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);

  let tags = $(".trader__change");
  function tabChange() {
    $(".movie").removeClass("movie");
    $(this).addClass("movie")
    $(".see").removeClass("see");
    const list = tags.index(this);
    $(".bought__text__list--message").removeClass("see").eq(list).addClass("see");
  }
  tags.click(tabChange);
});