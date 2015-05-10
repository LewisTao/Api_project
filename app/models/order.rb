class Order < ActiveRecord::Base
  # Association
  belongs_to :user
  has_many :placements
  has_many :products, through: :placements

  # Basic validate
  validates_presence_of :user_id, :total
  validates_numericality_of :total, greater_than_or_equal_to: 0

end
