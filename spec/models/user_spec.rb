require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:task)}
  end
 
  context 'Instanced Methods' do
  end
end
