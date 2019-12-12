FactoryBot.define do

  factory :item do
    name              {"靴"}
    price             {"3000"}
    prefecture_id     {"1"}
    delivery_id       {"2"}
    text              {"aaa"}
    state_id          {"1"}
    # thumbnails        {[build(:thumbnail, item: nil)]}
  end

  factory :item_with_thumbnail, class: Item do
    name              {"靴"}
    price             {"3000"}
    prefecture_id     {"1"}
    delivery_id       {"2"}
    text              {"aaa"}
    state_id          {"1"}

    after( :create ) do |item|
      create_list(:thumbnail, 3, item: item)
    end
  end

end