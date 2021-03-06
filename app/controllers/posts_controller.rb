class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i(show destroy)

  def index
    @posts = @q.result(distinct: true).order(created_at: "DESC").includes(:user)
    @q = Post.ransack(params[:q])
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :start_date, :start_time, :ending_time, :artist, :live_venue, photos_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
end
