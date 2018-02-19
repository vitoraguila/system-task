require 'rails_helper'

RSpec.feature "Subtasks", type: :feature do
  it 'Visit BoxSubTask in Task page' do
    @user = FactoryBot.create(:user)
    sign_in(@user)
    @task = FactoryBot.create(:task, user_id: @user.id)
    visit(task_path(@task.id))
    
    expect(page).to have_css('.subtask-page')
  end
end
