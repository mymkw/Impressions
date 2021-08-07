class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: :destroy
  
  
  #記事一覧
  def index
    @posts = Post.paginate(page: params[:page])
  end
  
  #記事表示
  def show
    @post = current_user.posts.find(params[:id])
  end

  #記事作成
  def new
    @post = current_user.posts.build
  end
  
  #記事投稿
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  #記事編集
  def edit
    @post = Post.find(params[:id])
  end
  
  #記事更新
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end
  
  #記事削除
  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post).permit(:title,:body)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
