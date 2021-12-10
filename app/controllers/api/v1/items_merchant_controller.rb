class Api::V1::ItemsMerchantController < ApplicationController
  def show
    if Item.exists?(params[:id])
    item = Item.find(params[:id])
    merchant = item.merchant
    render json: MerchantSerializer.new(merchant)
    else
      render json: {errors: {details: "merch doesnt exist"}}, status: :not_found
    end
  end
end
