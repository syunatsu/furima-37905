class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :address, :building_name, :phone_number, :prefecture_id, :token

  # バリデーションを記述
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 digits or more and 11 digits or less' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
  end
  # saveメソッドを記述
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, city: city, address: address, building_name: building_name,
                       phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end
