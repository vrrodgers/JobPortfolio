class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status]
  before_action :set_user, only: [:index, :search]
  before_action :set_blog_title, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_topic, only: [:index, :search]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :toggle_status]}, site_admin: :all

  def search
    if params[:search]
      @blogs= Blog.page.where('title ILIKE ?', "%" + params[:search] + "%").per(5).latest
    end
  end  
  
  # GET /blogs
  # GET /blogs.json
  def index
    case
      when params[:title] && @admin_user
        @blogs = @topic.blogs.page(params[:page]).per(5).latest
      when params[:title] && @non_admin
        @blogs = @topic.blogs.published.page(params[:page]).per(5).latest
      when params[:tag] && @admin_user
        @blogs = Blog.page.tagged_with(params[:tag]).per(5).latest
      when params[:tag] && @non_admin
       @blogs = Blog.published.page.tagged_with(params[:tag]).per(5).latest
      when @non_admin
        @blogs = Blog.published.page(params[:page]).per(5).latest
      else
        @blogs = Blog.page(params[:page]).per(5).latest
    end
    @page_title = "My Portfolio Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
    @blog= Blog.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    
    @page_title = @blog.title
    @seo_keywords = @blog.body
    else 
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully removed.' }
      format.json { head :no_content }
    end
  end
  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif 
      @blog.published!
      @blog.draft! 
    end
    redirect_to blogs_url, notice: 'Post status has been updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status, :tag_list)
    end
    private

  def set_sidebar_topics
    @set_side_bar_topics = Topic.with_blogs
  end

  def set_user
    @admin_user = logged_in?(:site_admin)
    @non_admin = !logged_in?(:site_admin)
    @user = User.first
  end

  def set_blog_title
    @page_title = @blog.title
  end
    
  def set_topic
    if logged_in?(:site_admin)
      @topics= Topic.with_blogs
    else
      @topics= Topic.with_blogs_published
    end
    @topic= Topic.find_by(:title => params[:title])

  end

end
