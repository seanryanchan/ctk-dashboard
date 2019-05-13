class Product < ApplicationRecord
  require 'csv'
  has_many :purchase_entries

  def self.to_csv
    CSV.generate do |csv|
      columns = %w(id brand product_type quantity)
      csv << columns.map(&:humanize)
      all.each do |p|
        csv << p.attributes.values_at(*columns)
      end
    end
  end
end
