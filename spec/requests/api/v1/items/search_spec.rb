require 'rails_helper'

RSpec.describe 'search' do
  it "can find all items by name" do
    merchant = create(:merchant)
    items = create_list(:item, 5, merchant: merchant)

    get '/api/v1/items/find_all', params: { name: 'NOMATCH'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    items = JSON.parse(response.body, symbolize_names: true)

    items[:data].each do |item|
     expect(item).to have_key(:id)
     expect(item).to have_key(:type)
     expect(item).to have_key(:attributes)
     expect(item[:attributes]).to have_key(:name)
    end
   end
   it "has no matches" do
     merchant = create(:merchant)
     items = create_list(:item, 5, merchant: merchant)

     get '/api/v1/items/find_all', params: { name: 'NOMATCH'}

     items = JSON.parse(response.body, symbolize_names: true)

     expect(items).to have_key(:data)
     expect(items[:data]).to be_empty
   end
  end
