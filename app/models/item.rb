class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
            format: {with: /\A[0-9]+\z/ }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: '---以外を選択してください'}
  validates :category_id, presence: true, numericality: { other_than: 1, message: '---以外を選択してください'}
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1, message: '---以外を選択してください'}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: '---以外を選択してください'}
  validates :shipment_day_id, presence: true, numericality: {other_than: 1, message: '---以外を選択してください'}
  validate :validate_image # 画像のバリデーション

  private
  # 画像のバリデーションメソッド
  def validate_image
    unless self.image.attached?
      errors.add(:image, 'を１枚添付してください')
    end
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
