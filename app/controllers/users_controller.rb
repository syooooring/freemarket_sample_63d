class UsersController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def zoom
  end
  
  def registration
  end

  def sms_confirmation
  end

  def address
  end

  def card
  end

  def complete
  end

  def profile
  end

  def card_info
  end

  def logout
  end
  
  def identification
  end

  def saling
    user = User.find(params[:id])
    @items = user.saling_items
  end

  def selling
    user = User.find(params[:id])
    @items = user.selling_items
  end

  def sold
    user = User.find(params[:id])
    @items = user.sold_items
  end

end