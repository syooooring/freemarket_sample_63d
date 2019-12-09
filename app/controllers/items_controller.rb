class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.thumbnails.build
  end

  def create
    @item = Item.new(item_params)
    #@item = current_user.item.build(item_params)
    #ユーザー登録が実装されれば上記に変更
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
    params.require(:item).permit(:name, :size, :state, :delivery_fee, :shipping_method, :estimated_shipping_date, :price, :text, :prefecture_id,  thumbnails_attributes: [:images])
  end

end

