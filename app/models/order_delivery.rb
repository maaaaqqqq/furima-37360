class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :tel, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
  end
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めて入力してください' }
  validates :tel, format: { with: /\A\d{10,11}\z/ ,message:'は10桁以上11桁以下で入力してください'},
                  numericality: { only_integer: true, message: 'は無効です' }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                    building_name: building_name, tel: tel, order_id: order.id, token: token)
  end
end
