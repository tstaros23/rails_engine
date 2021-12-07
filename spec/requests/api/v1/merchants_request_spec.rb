require 'rails_helper'

 RSpec.describe 'Merchants API' do
   it 'Gets All Merchants' do
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

     get "/api/vi/merchants/#{merchant.id}"

     expect(response).to be_successful
     expect(response.status).to eq(200)
     merchant = JSON.parse(response.body, symbolize_names: true)

     expect(merchant[:data]).to have_key(:id)
     expect(merchant[:data]).to have_key(:type)
     expect(merchant[:data]).to have_key(:attributes)
     expect(merchant[:data][:attributes]).to have_key(:name)
   end
 end
