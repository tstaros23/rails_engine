class Api::V1::Items::SearchController < ApplicationController
  def index
    items = Item.search_for_names(params[:name])
    render json: ItemSerializer.new(items)
  end
end
