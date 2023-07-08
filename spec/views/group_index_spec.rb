require 'rails_helper'

RSpec.describe 'Group Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Emmanuel', email: 'balix@gmail.com', password: '123456')
    @group = Group.create(name: 'Travel', icon: 'travel.png', user: @user)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      visit groups_path
    end

    it 'returns the correct category on the page' do
      expect(page).to have_content('Travel')
    end

    it 'leads to correct page when link is clicked' do
      click_link 'Travel'
      expect(current_path).to eq(group_path(@group))
    end

    it 'has the add new category link' do
      expect(page).to have_link('Add New Category')
    end

    it 'leads to a page to add a new category' do
      click_link 'Add New Category'
      expect(current_path).to eq(new_group_path)
    end
  end
end
