class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items, :dependent => :destroy
  belongs_to :merchant

  # after_destroy :cleanup

  def self.search_for_names(name)
    where("name ILIKE ?", "%#{name.downcase}%")
  end

  # def cleanup
  #   boolean = Invoice.all.each do |invoice|
  #     invoice.items.count == 1
  #       invoice
  #   end
  # end
end
