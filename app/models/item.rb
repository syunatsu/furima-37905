class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
            format: {with: /^[0-9]+$/ }
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :dategory_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipment_id, presence: true
  validate :validate_image # 画像のバリデーション

  belongs_to :user
  has_one_attached :image

  private
  # 画像のバリデーションメソッド
  def validate_image
    unless item.image.attached?
      errors.add(:imaage, 'の画像を１枚添付してください')
    end
  end
end
