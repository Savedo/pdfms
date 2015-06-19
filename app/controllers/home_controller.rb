class HomeController < ApplicationController
  def index
    @items = Item.order(:name)
  end
end
