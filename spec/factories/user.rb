FactoryBot.define do

  factory :user do
    sequence(:email)   {Faker::Internet.email}
    password           {"testtest"}
    nickname           {"test"}
    introduction       {"testtesttest"}
    family_name        {"てすと"}
    last_name          {"てすとてすと"}
    j_family_name      {"テスト"}
    j_last_name        {"テストテスト"}
    birthday_year_id   {"3"}
    birthday_month_id  {"6"}
    birthday_day_id    {"12"}
    phone_number       {"08012341234"}
    image              {"https://www.illust-box.jp/db_img/sozai/00010/104595/watermark.jpg"}
    point              {"0"}
  end

end