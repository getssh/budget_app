require 'rails_helper'

RSpec.describe Exchange, type: :model do
  it { should belong_to(:author).class_name('User') }
  it { should have_and_belong_to_many(:categories) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:categories).with_message('must have at least one category') }
end
