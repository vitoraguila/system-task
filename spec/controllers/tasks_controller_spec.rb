require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do

    context "task exists" do
      context "User is the owner of the task" do
        it "Returns success" do
          task = create(:task, user: @current_user)
          get :show, params: {id: task.id}
          expect(response).to have_http_status(:success)
        end
      end

      context "User is not the owner of the task" do
        it "Redirects to root" do
          task = create(:task)
          get :show, params: {id: task.id}

          expect(response).to redirect_to('/')
        end
      end
    end

    context "task don't exists" do
      it "Redirects to root" do
        get :show, params: {id: 0}
        expect(response).to redirect_to('/')
      end
    end
  end


  describe "POST #create" do
    before(:each) do
      @task_attributes = attributes_for(:task, user: @current_user)
      post :create, params: {task: @task_attributes}
    end

    it "Redirect to new task" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/tasks/#{task.last.id}")
    end

    it "Create task with right attributes" do
      expect(task.last.user).to eql(@current_user)
      expect(task.last.title).to eql(@task_attributes[:title])
      expect(task.last.description).to eql(@task_attributes[:description])
    end

    it "Create task with owner associated as a member" do
      expect(task.last.members.last.name).to eql(@current_user.name)
      expect(task.last.members.last.email).to eql(@current_user.email)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "User is the task Owner" do
      it "returns http success" do
        task = create(:task, user: @current_user)
        delete :destroy, params: {id: task.id}
        expect(response).to have_http_status(:success)
      end
    end

    context "User isn't the task Owner" do
      it "returns http forbidden" do
        task = create(:task)
        delete :destroy, params: {id: task.id}
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_task_attributes = attributes_for(:task)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "User is the task Owner" do
      before(:each) do
        task = create(:task, user: @current_user)
        put :update, params: {id: task.id, task: @new_task_attributes}
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "task have the new attributes" do
        expect(task.last.title).to eq(@new_task_attributes[:title])
        expect(task.last.description).to eq(@new_task_attributes[:description])
      end
    end

    context "User isn't the task Owner" do
      it "returns http forbidden" do
        task = create(:task)
        put :update, params: {id: task.id, task: @new_task_attributes}
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  
end