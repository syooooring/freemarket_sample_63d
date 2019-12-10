class ItemsController < ApplicationController

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
    @item = Item.find(1)
  end

  def update
    item = Item.find(1)
    if item.update(item_params) 
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def details
    @item = Item.find(params[:id])
    @items = Item.where(saler_id: @item.saler_id).limit(6).order('id DESC')
    @price = "¥#{@item.price.to_s(:delimited)}"
    @state = @item.state.name
    @delivery = @item.delivery.name
    @date = @item.estimated_shipping_date.name
  end
  
  def address
  end

  def buy
  end

  def buy1
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(saler_id: @item.saler_id).limit(6).order('id DESC')
    @price = "¥#{@item.price.to_s(:delimited)}"
    @state = @item.state.name
    @delivery = @item.delivery.name
    @date = @item.estimated_shipping_date.name
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

private

  def item_params
    params.require(:item).permit(:name, :size, :state_id, :delivery_id, :shipping_method_id, :estimated_shipping_date_id, :price, :text, :prefecture_id,  thumbnails_attributes: [:images]).merge(user_id: current_user.id, saler_id: current_user.id)
  end

end