require 'spec_helper'

describe User do
	before { @user = FactoryGirl.build(:user) }

	subject { @user }

	# Basic user attributes
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
	it { should validate_confirmation_of(:password) }
	it { should allow_value('example@domain.com').for(:email) }

	it { should be_valid }

	# Authenticating users
	it { should respond_to(:auth_token) }
	it { should validate_uniqueness_of(:auth_token) }

	# Generate token

	describe 'generate_authentication_token!' do
		it 'generate a unique token' do
			Devise.stub(:friendly_token).and_return('auniquetoken123')
			@user.generate_authentication_token!
			expect(@user.auth_token).to eql 'auniquetoken123'
		end

		it 'generates another token when one already has been taken' do
			exists_user = FactoryGirl.create(:user, auth_token: 'auniquetoken123')
			@user.generate_authentication_token!
			expect(@user.auth_token).not_to eql exists_user.auth_token
		end
	end
end
