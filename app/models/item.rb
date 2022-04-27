class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipment_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validate :validate_image # 画像のバリデーション

  private

  # 画像のバリデーションメソッド
  def validate_image
    errors.add(:image, 'を１枚添付してください') unless image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment_day

  belongs_to :user
  has_one_attached :image
end
