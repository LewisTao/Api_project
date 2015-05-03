class Api::V1::ProductsController < ApplicationController
	respond_to :json

	def index
		products = Product.all.order('created_at DESC')

		respond_with products
	end

	def show
		product = Product.find_by(id: params[:id])

		respond_with product, status: 200, location: [:api, product]
	end
end
