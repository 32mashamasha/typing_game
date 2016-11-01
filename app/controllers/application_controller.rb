class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_current_user
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    '/homes/'
  end

  def set_current_user	
  	@user = current_user
  end
end
