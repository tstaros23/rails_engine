require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "relationships" do
    it { should have_many(:invoices).through(:invoice_items) }
    it { should belong_to :merchant }
  end
  it "can find all items by partial search" do
    merchant = create(:merchant)
    item = create(:item, name: 'Teds store', merchant: merchant)
    item2 = create(:item, name: 'Hardware Store', merchant: merchant)
    item3 = create(:item, name: 'Har', merchant: merchant)


    expect(Item.search_for_names('Ha')).to eq([item2, item3])
  end
end
