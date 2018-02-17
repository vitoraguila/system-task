require 'rails_helper'

RSpec.describe Task, type: :model do

  # I Vitor Hugo could to build the test without ShouldaMatchers according to exemplo below, but in my opnion is more verbose.
  # it 'is invalid without title' do
  #   task = build(:task, title: nil)
  #   task.valid?
  #   expect(task.errors[:title]).to include("can't be blank")
  # end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:subtask) }
    it { is_expected.to validate_presence_of(:task_date) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user)}
    it { is_expected.to have_many(:subtask)}
  end
 
  context 'Instanced Methods' do
  end
end
