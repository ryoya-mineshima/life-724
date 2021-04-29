class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    if user_signed_in? && current_user.id == @tweet.user_id 
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :url, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @tweet = Tweet.find(params[:id])
  end

end
