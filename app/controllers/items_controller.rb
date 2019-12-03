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
    @item = Item.find(1)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item:id)
  end

  def details
  end
  
  def buy
  end

  def buy1
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end