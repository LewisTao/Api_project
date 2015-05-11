class OrderSerializer < ActiveModel::Serializer
  # Basic attributes
  attributes :id, :total

  # Association
  has_many :products, serializer: OrderProductSerializer
end
