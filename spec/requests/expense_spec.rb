require 'rails_helper'

RSpec.describe Expense, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Emmanuel', email: 'balix@gmail.com', password: '123456')
    @expense = Expense.create(name: 'Food', amount: 700, user: @user)
    @group = Group.create(name: 'Health', icon: 'hospital.png', user: @user)
    @group_expense = GroupExpense.create(group: @group, expense: @expense)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      get group_path(@group.id)
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show page' do
      expect(response).to render_template('show')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Food')
    end
  end
end