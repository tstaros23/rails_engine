require 'rails_helper'

describe Merchant do
  describe "relationships" do
    it { should have_many :items }
    it { should have_many(:invoice_items).through(:items) }
    it {should have_many(:invoices).through(:invoice_items)}
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  it "can find merchant by name" do
    merchant = create(:merchant)
    merchant2 = create(:merchant, name: 'Hardware Store')


    expect(Merchant.search_for_names('Hardware')).to eq(merchant2)
  end
end
