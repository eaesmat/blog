class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def json_response(json, status)
    render json:, status:
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  # Catch all CanCan errors and alert the user of the exception

  def after_sign_out_path_for(_resource_or_scope)
    '/users/sign_in'
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Unauthorized user' }, status: 401 unless @current_user
  end
end
