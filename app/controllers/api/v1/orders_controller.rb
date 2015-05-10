class Api::V1::OrdersController < ApplicationController
	before_action :authenticate_with_token!

	def index
		orders = current_user.orders
		render json: orders, status: 200
	end
end
