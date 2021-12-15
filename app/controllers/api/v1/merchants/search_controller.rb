class Api::V1::Merchants::SearchController < ApplicationController
  def index
    merchants = Merchant.most_items(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end
  def show
    merchant = Merchant.search_for_names(params[:name])
    return render json: {data: {}} if merchant.nil?
    render json: MerchantSerializer.new(merchant)
  end
end
