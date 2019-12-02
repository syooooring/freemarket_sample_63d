class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(10).order(id: "DESC")
    #@items = Item.order("RAND()").limit(10) 
  end
  
  def show
  end

  def buy
  end

  def buy1
  end
  

end
