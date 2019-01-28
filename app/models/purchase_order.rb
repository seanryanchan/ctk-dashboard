class PurchaseOrder < ApplicationRecord
  has_and_belongs_to_many :products
end
