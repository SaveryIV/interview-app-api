class RatingsController < ApplicationController
  before_action :set_content
  before_action :set_rating, only: [:update, :destroy]
  before_action :authenticate_request

  def create
    existing_rating = @content.ratings.find_by(user: @current_user)
  
    if existing_rating
      render json: { error: 'You have already rated this content' }, status: :unprocessable_entity
    else
      @rating = @content.ratings.build(rating_params)
      @rating.user = @current_user
      @rating.stars ||= 0
  
      if @rating.save
        render json: @rating, status: :created
      else
        render json: @rating.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    @ratings = Rating.all

    if @ratings
      render json: @ratings, status: :ok
    else
      render json: { error: "Doesnt exist registers of ratings" }
    end
  end

  def show
    @rating = Rating.find(params[:id])
    render json: @rating, status: :ok
  end

  def update
    if @rating.update(rating_params)
      render json: @rating, status: :ok
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rating = @content.ratings.find_by(user: @current_user)

    if @rating
      @rating.destroy
      render json: { message: 'Rating successfully deleted', status: :destroyed }, status: :ok
    else
      render json: { error: 'Rating not found or not authorized' }, status: :not_found
    end
  end

  private

  def set_content
    @content = Content.find(params[:content_id])
  end

  def set_rating
    @rating = @content.ratings.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:stars)
  end
end
