require 'rails_helper'

 RSpec.describe 'search' do
   it'can find one merchant by name' do
     merchant = create(:merchant)
     get '/api/v1/merchants/find', params: { name: merchant.name}

     expect(response).to be_successful
     expect(response.status).to eq(200)


    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data]).to have_key(:type)
    expect(merchant[:data]).to have_key(:attributes)
    expect(merchant[:data][:attributes]).to have_key(:name)
   end

   it "sad path" do
     merchants = create_list(:merchant, 5)
     get '/api/v1/merchants/find/', params: { name: 'NOMATCH'}

     expect(response).to be_successful
     expect(response.status).to eq(200)

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants).to have_key(:data)
    expect(merchants[:data]).to be_empty
   end
 end
