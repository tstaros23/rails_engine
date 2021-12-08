class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.search_for_names(search)
    where("name ILIKE ?", "%#{search.downcase}%")
  end
end
