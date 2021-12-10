class Api::V1::Items::SearchController < ApplicationController
  def index
    items = Item.search_for_names(params[:name])
    return render json: {data: {}} if items.nil?
    render json: ItemSerializer.new(items)
  end
end
