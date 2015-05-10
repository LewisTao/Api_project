class Product < ActiveRecord::Base
	# Validattion attributes
	validates_presence_of :title, :price, :user_id
	validates_numericality_of :price, greater_than_or_equal_to: 0

	# Association
	belongs_to :user

	# Search by keyword
	scope :filter_by_title, lambda {|keyword| where("lower(title) LIKE ?", "%#{keyword.downcase}%")}

	# Search by price
	scope :above_or_equal_to_price, lambda{|price| where("price >= ?", price)}

	scope :below_or_equal_to_price, lambda{|price| where("price <= ?", price)}

	# Search by creation
	scope :recent, -> {order(:updated_at)}

	# Search by engine
	def self.search(params = {})
		products = params[:product_ids].present? ? Product.find(params[:product_ids]) : Product.all

		products = products.filter_by_title(params[:keyword]) if params[:keyword]
		products = products.above_or_equal_to_price(params[:min_price].to_f) if params[:min_price]
		products = products.below_or_equal_to_price(params[:max_price].to_f) if params[:max_price]
		products = products.recent(params[:recent]) if params[:recent].present?

		products
	end
end
