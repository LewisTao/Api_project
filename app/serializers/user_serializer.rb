class UserSerializer < ActiveModel::Serializer
  # Basic attributes
  attributes :id, :email, :created_at, :updated_at, :auth_token

  # Embed products id to user json response
  embed :ids

  # Association
  has_many :products
end
