require 'rails_helper'

RSpec.describe SubtasksController, type: :controller do

  describe "POST #create" do
    it "Create three subtask" do
      subtasks = create_list(:subtask, 3)
      expect(subtasks.count).to eq(3)
    end
  end

  
end