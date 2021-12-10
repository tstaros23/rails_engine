class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items, :dependent => :destroy
  belongs_to :merchant


  def self.search_for_names(name)
    where("name ILIKE ?", "%#{name.downcase}%")
  end
end
