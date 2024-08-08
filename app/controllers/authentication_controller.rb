class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def logout
    if params[:token].present?
      BlacklistedToken.create!(token: params[:token], expires_at: 1.hour.from_now)
      head :no_content
    else
      render json: { error: 'Token no proporcionado' }, status: :bad_request
    end
  end
end
