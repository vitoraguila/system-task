require 'rails_helper'

RSpec.describe Subtask, type: :model do
  context 'Validates' do
    it { is_expected.to validate_presence_of(:description) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:task)}
  end
 
  context 'Instanced Methods' do
  end
end
