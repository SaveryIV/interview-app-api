class ContentsController < ApplicationController
  before_action :authenticate_request
  before_action :set_content, only: [:show, :update, :destroy]

  def index
    @contents = Content.all
    render json: @contents, status: :ok
  end

  def show
    total_stars = @content.ratings.sum(:stars)

    render json: {
      content: @content,
      average_rating: @content.average_rating,
      total_stars: total_stars
    }, status: :ok
  end

  def new
    @content = Content.new
    render json: @content
  end

  def create
    existing_content = Content.find_by(title: content_params[:title], author: @current_user)

    if existing_content
      render json: { error: 'Content with this title already exists' }, status: :unprocessable_entity
    else
      @content = Content.new(content_params)
      @content.author = @current_user

      if @content.save
        render json: @content, status: :created
      else
        render json: @content.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @content.author == @current_user
      if @content.update(content_params)
        render json: @content, status: :ok
      else
        render json: @content.errors, status: :unprocessable_entity
      end
    else
      render json: { meesage: "Unauthorized action" }, status: :forbidden
    end
  end

  def destroy
    if @content.author == @current_user
      @content.destroy
      render json: { message: 'Content successfully destroyed' }, status: :ok
    else
      render json: { error: 'You are not authorized to delete this content' }, status: :forbidden
    end
  end

  private

  def set_content
    @content = Content.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'Content not found' }, status: :not_found
  end

  def content_params
    params.require(:content).permit(:title, :description, :category, :thumbnail_url, :content_url)
  end
end
