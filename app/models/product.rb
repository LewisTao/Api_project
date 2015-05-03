class Product < ActiveRecord::Base
	# Validate attributes
	validates_presence_of :title, :price, :user_id
	validates_numericality_of :price, greater_than_or_equal_to: 0

end
