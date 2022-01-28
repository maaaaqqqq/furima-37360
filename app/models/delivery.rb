class Delivery < ApplicationRecord
  belongs_to :order
  attr_accessor :token
end
