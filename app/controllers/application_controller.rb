class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    if token && BlacklistedToken.exists?(token: token)
      render json: { error: 'No valid Token' }, status: :unauthorized
    else
      begin
        decoded = jwt_decode(token)
        @current_user = User.find(decoded[:user_id])
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError
        render json: { error: 'Unauthorized User' }, status: :unauthorized
      end
    end
  end
end