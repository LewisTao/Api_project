class Product < ActiveRecord::Base
	# Validattion attributes
	validates_presence_of :title, :price, :user_id
	validates_numericality_of :price, greater_than_or_equal_to: 0

	# Association
	belongs_to :user

	# Search by keyword
	scope :filter_by_title, lambda {|keyword| where("lower(title) LIKE ?", "%#{keyword.downcase}%")}
end
