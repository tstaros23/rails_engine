class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.search_for_names(search)
    where('LOWER(name) LIKE ?', "%#{search.downcase}%").first
  end

  # def self.most_items(quantity)
  #   Merchant.joins(items: [{invoices: :transactions}])
  #   .where(transactions: {result: 'success'})
  #   .group(:id)
  #   .select("merchants.*, sum(invoice_items.quantity) as count")
  #   .order('count DESC')
  #   .limit(quantity)
  # end
end
