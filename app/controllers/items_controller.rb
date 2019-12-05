class ItemsController < ApplicationController
  # before_action :set_item, only: [:edit, :update]
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
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end
end