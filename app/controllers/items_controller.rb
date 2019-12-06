class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(10).order(id: "DESC")
  end
  
  def show
  end

  def new
  end

  def create
  end

  def edit
    @item = Item.find(4)
  end

  def update
    item = Item.find(4)
    if item.update(item_params) 
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def details
  end
  
  def buy
  end

  def buy1
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :prefecture_id , :state_id ,:delivery_id, :estimated_shipping_data_id,:image)
  end
end