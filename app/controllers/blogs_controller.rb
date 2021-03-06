class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :destroy, :toggle_status]
  layout "blog"
  # GET /blogs 
  def index
    @blogs = Blog.all
    @page_title = "MY Portfolio | Blog"
  end

  # GET /blogs/1 
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/edit
  def edit
  end

  # POST /blogs 
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Your Post is Now Live." }
        
      else
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /blogs/1 
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  # DELETE /blogs/1 
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to blogs_url, notice: 'Post status has been updated.'
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
