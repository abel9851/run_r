class TweetsController < ApplicationController
  before_action :set_params, only: [ :show, :destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @messages = Message.includes(:tweet, :user)
    @message = Message.new
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_params
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end

end
