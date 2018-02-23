class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    redirect_to main_app.root_url
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end 
end
