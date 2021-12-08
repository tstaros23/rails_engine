require 'rails_helper'

 RSpec.describe 'Items API' do
   it "can update an existing Item" do
     merchant = create(:merchant)
     id = create(:item, merchant: merchant).id
     previous_name = Item.last.name
     previous_description = Item.last.description
     previous_unit_price = Item.last.unit_price
     item_params = {name: "Awesome Sauce", description: "Tomato Sauce", unit_price: "29.99"}
     headers = {"CONTENT_TYPE" => "application/json"}

     patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})

     item = Item.find_by(id: id)

     expect(response).to be_successful
     expect(item.name).to_not eq(previous_name)
     item_data = merchant = JSON.parse(response.body, symbolize_names: true)
     expect(response.status).to eq(200)

     expect(item_data[:data]).to have_key(:id)
     expect(item_data[:data]).to have_key(:type)
     expect(item_data[:data]).to have_key(:attributes)
     expect(item_data[:data][:attributes]).to have_key(:name)
   end
 end
