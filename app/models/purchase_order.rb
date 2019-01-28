class PurchaseOrder < ApplicationRecord
  has_many :purchase_entries
end
