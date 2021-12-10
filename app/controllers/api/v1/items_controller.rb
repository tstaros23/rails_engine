class Api::V1::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      render json: ItemSerializer.new(item)
    else
      render json: {errors: {details: "item doesnt exist"}}, status: :not_found
    end

  end

  def create
    created_item = Item.create(item_params)
    render json: ItemSerializer.new(created_item), status: :created
  end

  def update
      item = Item.find(params[:id])
      if !item.nil? && !params[:merchant_id].present?
      updated_item = Item.update(item.id, item_params)
      render json: ItemSerializer.new(updated_item)
    elsif params[:merchant_id].present?
      merchant = Merchant.find(params[:merchant_id])
      updated_item = Item.update(item.id, item_params)
      return  render json: {errors: {details: "merchant doesnt exist"}}, status: :not_found if merchant.nil?
      render json: ItemSerializer.new(updated_item)
    else
      render json: {errors: {details: "item doesnt exist"}}, status: :not_found
    end
  end

  def destroy
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      item.destroy
    else
      render json: {errors: {details: "item doesnt exist"}}, status: :not_found
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
    end
end
