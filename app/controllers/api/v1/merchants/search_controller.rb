class Api::V1::Merchants::SearchController < ApplicationController
  def show
    merchant = Merchant.search_for_names(params[:name])
    return render json: {data: {}} if merchant.nil?
    render json: MerchantSerializer.new(merchant)
  end
end
