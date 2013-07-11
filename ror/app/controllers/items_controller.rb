class ItemsController < ApplicationController
  def show
    item = Item.find_by_name(params[:q])
    render json: item
  end
end