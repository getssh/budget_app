require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:exchanges).with_foreign_key('author_id') }
  it { should validate_presence_of(:name) }
end
