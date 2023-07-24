require 'rails_helper'

RSpec.describe 'Exchanges integration tests', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'John', email: 'john@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.create(name: 'Category 1', icon: 'icon.png')
    @exchange1 = @category.exchanges.create(name: 'Exchange 1', amount: 100)
    @exchange2 = @category.exchanges.create(name: 'Exchange 2', amount: 200)
    @exchange3 = @category.exchanges.create(name: 'Exchange 3', amount: 300)

    login_as(@user, scope: :user)
    visit category_exchanges_path(@category)
  end

  it 'should display the category name and total amount' do
    expect(page).to have_content(@category.name)
    total_amount = format('Total Amount: %.1f', @category.exchanges.sum(:amount))
    expect(page).to have_content(total_amount)
  end

  it 'should display a link to go back to categories' do
    expect(page).to have_link('<', href: categories_path)
  end

  it 'should display a link to add a new transaction' do
    expect(page).to have_link('Add a new transaction', href: new_category_exchange_path(@category))
  end
end
