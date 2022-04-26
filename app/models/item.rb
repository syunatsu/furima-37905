class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :dategory_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipment_id, presence: true
  # validates :image presence: true??

  belongs_to :user
end
