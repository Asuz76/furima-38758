class Purchaseform
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :adress, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :adress
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, adress: adress,
                    building: building, phone_number: phone_number)
  end
end
