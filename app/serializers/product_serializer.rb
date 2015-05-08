class ProductSerializer < ActiveModel::Serializer
  # Basic product attributes
  attributes :id, :title, :price, :published

  # Association
  has_one :user
end
