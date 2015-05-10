class UserSerializer < ActiveModel::Serializer
  # Basic attributes
  attributes :id, :email, :auth_token, :password

  # Embed products id to user json response
  # Association
  has_many :products
end
