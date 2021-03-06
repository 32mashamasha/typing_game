class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_current_user

  def after_sign_in_path_for(resource)
    '/homes/'
  end

  def set_current_user	
  	@user = current_user
  end
end
