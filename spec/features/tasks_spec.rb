require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  it 'Visit Task page' do
    sign_in(FactoryBot.create(:user))
    visit(tasks_path)
    expect(page).to have_current_path(tasks_path)
  end

  it 'Create a Task' do
    task = create(:task)
    sign_in(FactoryBot.create(:user))

    visit(new_task_path)

    fill_in('Title', with: "Nova tarefa teste")
    fill_in('Description', with: FFaker::Lorem.sentence)
    select('Public status', :from => 'Type status')
    # fill_in('Select status', with: :public_status)
    fill_in('Task date', with: FFaker::Time.date)
    fill_in('Task hour', with: rand(24).to_s)

    click_button('Create Task')

    expect(page).to have_css('.task-card')
  end
end
