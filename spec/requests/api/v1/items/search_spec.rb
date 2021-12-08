require 'rails_helper'

RSpec.describe 'search' do
  it "can find all items by name" do
    merchant = create(:merchant)
    item = create(:item, 5, merchant: merchant)

    get '/api/vi/items/find_all', params: { name: 'H'}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(5)

    items[:data].each do |item|
     expect(item).to have_key(:id)
     expect(item).to have_key(:type)
     expect(item).to have_key(:attributes)
     expect(item[:attributes]).to have_key(:name)
   end
  end
end
