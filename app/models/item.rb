class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_one :bought_item_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shippingdate

  validates :image, :name, :description, presence: true
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shippingdate_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
end
