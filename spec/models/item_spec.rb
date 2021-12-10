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

  # it "destroy any invoice if this was the only item on an invoice" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   item = create(:item, name: 'Teds store', merchant: merchant)
  #   item2 = create(:item, name: 'Hardware Store', merchant: merchant)
  #   item3 = create(:item, name: 'Har', merchant: merchant)
  #   invoice = create(:invoice, customer: customer)
  #   invoice2 = create(:invoice, customer: customer)
  #   invoice3 = create(:invoice, customer: customer)
  #   invoice_item = create(:invoice_item, item: item, invoice: invoice)
  #   invoice_item2 = create(:invoice_item, item: item, invoice: invoice2)
  #   invoice_item3 = create(:invoice_item, item: item2, invoice: invoice3)
  #
  #   expect(item.cleanup).to eq(true)
  #   expect(item2.cleanup).to eq(false)
  # end
end
