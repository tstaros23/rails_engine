class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    if Merchant.exists?(params[:id])
      merchant = Merchant.find(params[:id])
      items = merchant.items
      something = render json: {merchant: MerchantSerializer.new(merchant), items: MerchantSerializer.new(items)}

    else
      render json: {errors: {details: "merch doesnt exist"}}, status: 404
    end
  end
end
