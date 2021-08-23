class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  protected
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      token == 'FOO'
    end
  end

  def render_unauthorized
    # render_errors(:unauthorized, ['invalid token'])
    obj = { message: 'token invalid' }
    render json: obj, status: :unauthorized
  end
end
