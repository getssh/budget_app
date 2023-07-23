

require 'rails_helper'

RSpec.describe 'Categories integration tests', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'John', email: 'john@gmail.com', password: '123456', password_confirmation: '123456')
    @first_category = Category.create(name: 'Category 1', icon: 'icon.png')
    @second_category = Category.create(name: 'Category 2', icon: 'icon.png')
    @third_category = Category.create(name: 'Category 3', icon: 'icon.png')
    @categories = [@first_category, @second_category, @third_category]

    login_as(@user, scope: :user)
  end

  describe 'index page' do
    before { visit categories_path }

    it 'should display the title "Categories"' do
      expect(page).to have_content('Categories')
    end

    it 'should display each category details' do
      @categories.each do |category|
        expect(page).to have_content(category.name)
        expect(page).to have_css("img[src*='#{category.icon}']")
        expect(page).to have_content(category.exchanges.sum(:amount))
      end
    end

    it 'should display a link to create a new category' do
      expect(page).to have_link('Add a new category', href: new_category_path)
    end
  end
end
