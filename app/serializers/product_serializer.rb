class ProductSerializer < ActiveModel::Serializer
  # Basic product attributes
  attributes :id, :title, :price, :published

  # Association
  #belongs_to :user
end
