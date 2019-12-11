class ItemsController < ApplicationController
  before_action :set_item, only: [:details, :show, :edit, :update, :destroy]
  before_action :set_details, only: [:details, :show]
  
  def index
    @items = Item.all.limit(10).order(id: "DESC")
  end
  
  def new
    @item = Item.new
    @item.thumbnails.build
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
          params[:thumbnails][:images].each do |image|
            @item.thumbnails.create(images: image, item_id: @item.id)
          end
        format.html{redirect_to root_path}
      else
        @item.thumbnails.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
  end

  def update
    if @item.update(item_params) 
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
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

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

private


  def item_params
    params.require(:item).permit(:name, :size, :state_id, :delivery_id, :shipping_method_id, :estimated_shipping_date_id, :price, :text, :prefecture_id,  thumbnails_attributes: [:images]).merge(user_id: current_user.id, saler_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def set_details
    @items = Item.where(saler_id: @item.saler_id).limit(6).order('id DESC')
    @price = "¥#{@item.price.to_s(:delimited)}"
    @state = @item.state.name
    @delivery = @item.delivery.name
    @date = @item.estimated_shipping_date.name
  end

end
