require 'spec_helper'

describe Api::V1::ProductsController do
	
	# Show action
	describe 'GET #show' do
		before(:each) do
			@product = FactoryGirl.create :product
			get :show, id: @product.id
		end

		it 'returns the information about a reporter on a hash' do
			expect(json_response[:title]).to eql @product.title
		end

		it { should respond_with 200 }
	end

	# Index action
	describe 'GET #index' do
		before(:each) do
			4.times { FactoryGirl.create :product }
			get :index
		end

		it 'returns 4 records from the datavase' do
			expect(json_response[:products]).to have(4).times
		end

		it { should respond_with 200 }
	end
end
