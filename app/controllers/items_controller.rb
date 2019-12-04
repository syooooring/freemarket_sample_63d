class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    1.times {@item.thumbnails.build}
  end

  def create
    @item = Item.create(item_params)
    @item.save
    redirect_to root_path
  end

  def details
  end
  
  def address
  end

  def buy
  end

  def buy1
  end

private

  def item_params
    params.require(:item).permit(:name, :size, :state, :delivery_fee, :shipping_method, :estimated_shipping_date, :price, :text, :prefecture_id, thumbnails_attributes: [:images])
  end

  # def create_params
  #   params.require(:item).permit(thumbnails_attributes: [:image])
  # end

end

