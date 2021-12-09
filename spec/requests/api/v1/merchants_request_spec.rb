require 'rails_helper'

 RSpec.describe 'Merchants API' do
   it 'can send all merchants' do
     create_list(:merchant, 3)

     get '/api/v1/merchants'

     expect(response).to be_successful
     expect(response.status).to eq(200)
     merchants = JSON.parse(response.body, symbolize_names: true)

     expect(merchants[:data].count).to eq(3)

     merchants[:data].each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant).to have_key(:type)
      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes]).to have_key(:name)
    end
   end

   it "can send one merchant" do
     merchant = create(:merchant)

     get "/api/v1/merchants/#{merchant.id}"

     expect(response).to be_successful
     expect(response.status).to eq(200)
     merchant = JSON.parse(response.body, symbolize_names: true)

     expect(merchant[:merchant][:data]).to have_key(:id)
     expect(merchant[:merchant][:data]).to have_key(:type)
     expect(merchant[:merchant][:data]).to have_key(:attributes)
     expect(merchant[:merchant][:data][:attributes]).to have_key(:name)
   end

   it "can send the merchant items" do
     merchant = create(:merchant)
     items = create_list(:item, 3, merchant: merchant)

     get "/api/v1/merchants/#{merchant.id}/items"

     expect(response).to be_successful
     expect(response.status).to eq(200)

     merchant_items = JSON.parse(response.body, symbolize_names: true)

     expect(merchant_items[:data].count).to eq(3)

     merchant_items[:data].each do |item|
       expect(item).to have_key(:id)
       expect(item).to have_key(:type)
       expect(item).to have_key(:attributes)
       expect(item[:attributes]).to have_key(:name)
       expect(item[:attributes]).to have_key(:description)
       expect(item[:attributes]).to have_key(:unit_price)
     end
   end
 end
