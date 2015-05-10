class UserSerializer < ActiveModel::Serializer
  # Basic attributes
  attributes :id, :email

  # Embed products id to user json response
  # Association
  has_many :products
end
