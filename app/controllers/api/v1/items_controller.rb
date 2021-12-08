class Api::V1::ItemsController < ApplicationController
  def update
    item = Item.find(params[:id])
    updated_item = Item.update(item.id, item_params)
    rendered = render json: ItemSerializer.new(updated_item)
  end
  private
    def item_params
      params.require(:item).permit(:name, :description, :unit_price)
    end
end
