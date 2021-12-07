class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    something = render json: MerchantSerializer.format_merchants(merchants)
  end
end
