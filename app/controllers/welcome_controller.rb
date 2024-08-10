class WelcomeController < ApplicationController
  skip_before_action :authenticate_request
  def index
    render json: { message: 'Welcome to the API!' }, status: :ok
  end
end
