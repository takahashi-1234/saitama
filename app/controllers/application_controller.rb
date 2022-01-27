class ApplicationController < ActionController::Base

  before_action:configure_permitted_parameters,if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end
  def tag_list
    @tags = Tag.order(created_at: :desc).page(params[:page])
  end

end