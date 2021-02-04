class FeedsController < ApplicationController
  protect_from_forgery
  before_action :set_feed, only: %i[show edit update destroy ]
  before_action :authenticate_user, {only: [:create]}
  def index
    @feeds = Feed.all
  end
  def show
  end
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end
  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: "Feed was successfully created." }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
  end
  def edit
  end
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: "Feed was successfully updated." }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: "Feed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_feed
    @feed = Feed.find(params[:id])
  end
  def feed_params
    params.require(:feed).permit(:image, :image_cache, :content, :user_id)
    # .merge(user_id: current_user.id)
  end
  def authenticate_user
  # 現在ログイン中のユーザが存在しない場合、ログインページにリダイレクトさせる。
    if @current_user == nil
    flash[:notice] = t('notice.login_needed')
    redirect_to new_session_path
    end
  end
end
