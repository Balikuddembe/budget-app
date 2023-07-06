require 'rails_helper'

RSpec.describe Group, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Emmanuel', email: 'balix@gmail.com', password: '123456')
    @group = Group.create(name: 'Groceries', icon: 'shopping.png', user: @user)
  end

  describe 'GET /index' do
    before :each do
      sign_in @user
      get groups_path
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index page' do
      expect(response).to render_template('index')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Groceries')
    end
  end
end
