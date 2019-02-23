# The users.
# 0 is purchasing, 1 is admin
User.create(username: "user", password: "password", password_confirmation: "password", rank: 0)
User.create(username: "Michael", password: "password", password_confirmation: "password", rank: 1)
User.create(username: "Carl", password: "password", password_confirmation: "password", rank: 1)
User.create(username: "Miguel", password: "password", password_confirmation: "password", rank: 1)
User.create(username: "Cy", password: "password", password_confirmation: "password", rank: 0)
User.create(username: "Andii", password: "password", password_confirmation: "password", rank: 1)

# The inventory.

Product.create(brand: "REYFLEX", product_type: "Tires", quantity: "130", unit_price: 10.0)
Product.create(brand: "REYFLEX", product_type: "Radiator", quantity: "50", unit_price: 10.0)
Product.create(brand: "REYFLEX", product_type: "Windows", quantity: "80", unit_price: 10.0)
Product.create(brand: "New Springfield Auto Supply", product_type: "Tires", quantity: "100", unit_price: 10.0)
Product.create(brand: "New Springfield Auto Supply", product_type: "Radiator", quantity: "50", unit_price: 10.0)
Product.create(brand: "New Springfield Auto Supply", product_type: "Windows", quantity: "80", unit_price: 10.0)
Product.create(brand: "REYFLEX", product_type: "Tires", quantity: "100", unit_price: 10.0)
Product.create(brand: "REYFLEX", product_type: "Radiator", quantity: "50", unit_price: 10.0)
Product.create(brand: "REYFLEX", product_type: "Windows", quantity: "80", unit_price: 10.0)
Product.create(brand: "New Springfield Auto Supply", product_type: "Tires", quantity: "100", unit_price: 10.0)
Product.create(brand: "New Springfield Auto Supply", product_type: "Radiator", quantity: "50", unit_price: 10.0)
Product.create(brand: "New Springfield Auto Supply", product_type: "Windows", quantity: "80", unit_price: 10.0)
Product.create(brand: "REYFLEX", product_type: "Tires", quantity: "200", unit_price: 10.0)

# Purchase Order Entry with status 2 is backlogged, 1 is confirmed, 0 is unconfirmed.
# Purchase Order with status 2 is backlogged, 1 is confirmed, 0 is unconfirmed.
PurchaseOrder.create(status: 0).purchase_entries = [
  PurchaseEntry.create(status: 0, product_id: 4, product_qty: 100),
  PurchaseEntry.create(status: 0, product_id: 5, product_qty: 50),
  PurchaseEntry.create(status: 0, product_id: 6, product_qty: 80)
]
PurchaseOrder.create(status: 1).purchase_entries = [
  PurchaseEntry.create(status: 0, product_id: 10, product_qty: 100),
  PurchaseEntry.create(status: 0, product_id: 11, product_qty: 50),
  PurchaseEntry.create(status: 0, product_id: 12, product_qty: 80)
]
PurchaseOrder.create(status: 0).purchase_entries = [
  PurchaseEntry.create(status: 2, product_id: 1, product_qty: 100),
  PurchaseEntry.create(status: 2, product_id: 2, product_qty: 50),
  PurchaseEntry.create(status: 2, product_id: 3, product_qty: 80),
  PurchaseEntry.create(status: 2, product_id: 10, product_qty: 100),
  PurchaseEntry.create(status: 2, product_id: 11, product_qty: 50),
  PurchaseEntry.create(status: 2, product_id: 12, product_qty: 80)
]

History.create(user_id: 4,
  date_action: DateTime.parse("December 6 2018 10:00:00 AM"),
  log_in_timestamp: DateTime.parse("December 6 2018 10:00:00 AM"),
  log_out_timestamp: DateTime.parse("December 6 2018 1:00:00 PM")
)
History.create(user_id: 6,
  date_action: DateTime.parse("December 6 2018 12:00:00 PM"),
  log_in_timestamp: DateTime.parse("December 6 2018 12:00:00 PM"),
  log_out_timestamp: DateTime.parse("December 6 2018 4:00:00 PM")
)
History.create(user_id: 4,
  date_action: DateTime.parse("December 6 2018 15:00:00"),
  log_in_timestamp: DateTime.parse("December 6 2018 15:00:00"),
  log_out_timestamp: DateTime.parse("December 6 2018 20:00:00")
)
History.create(user_id: 3,
  date_action: DateTime.parse("December 6 2018 9:00:00 AM"),
  log_in_timestamp: DateTime.parse("December 6 2018 9:00:00 AM"),
  log_out_timestamp: DateTime.parse("December 6 2018 13:00:00")
)
History.create(user_id: 5,
  date_action: DateTime.parse("December 6 2018 15:30:00"),
  log_in_timestamp: DateTime.parse("December 6 2018 15:30:00"),
  log_out_timestamp: DateTime.parse("December 6 2018 19:45:00")
)
History.create(user_id: 4,
  date_action: DateTime.parse("December 6 2018 7:00:00"),
  log_in_timestamp: DateTime.parse("December 6 2018 7:00:00"),
  log_out_timestamp: DateTime.parse("December 6 2018 11:00:00")
)
History.create(user_id: 4,
  date_action: DateTime.parse("December 6 2018 8:00:00"),
  log_in_timestamp: DateTime.parse("December 6 2018 8:00:00"),
  log_out_timestamp: DateTime.parse("December 6 2018 15:00:00")
)
