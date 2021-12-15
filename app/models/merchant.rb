class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.search_for_names(search)
    where('LOWER(name) LIKE ?', "%#{search.downcase}%").first
  end

  def self.most_items(quantity)
    Merchant.joins(:items, invoices: [:invoice_items, :transactions]).where(transactions: {result: :success}).group(:id).select("merchants.*, count('invoice_items.id*') as count").order('count DESC').distinct.limit(quantity)
  end
end
