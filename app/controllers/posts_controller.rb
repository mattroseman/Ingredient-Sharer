class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    # Show posts that are only alive
    # @posts = Post.all
    @posts = Post.where('(created_at + ttl) > ?', Time.now).order("#{params[:sort_param]}")
    @show_newest_first = true
  end
  

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @comment = Comment.new(post_id: params[:post_id])
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    # update markov model
    # TODO break this out into a helper function
    word_list = post_params[:content].split
    prev_word = ""
    word_list.each do |word|
      word = word.gsub(/[^0-9A-Za-z']/, '')
      begin
        # check to see if the markov state already exists
        markov_state = MarkovModel.find [prev_word, word]
        # if it does exist increase count by one
        markov_state.increment! :count
      rescue ActiveRecord::RecordNotFound
        # if it doesn't exist then create a row for this markov state
        MarkovModel.create word: prev_word, next_word: word, count: 1
      end
      prev_word = word
    end

    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # update markov model
    # TODO break this out into a helper function
    word_list = post_params[:content].split
    prev_word = ""
    word_list.each do |word|
      word = word.gsub(/[^0-9A-Za-z']/, '')
      begin
        # check to see if the markov state already exists
        markov_state = MarkovModel.find [prev_word, word]
        # if it does exist increase count by one
        markov_state.increment! :count
      rescue ActiveRecord::RecordNotFound
        # if it doesn't exist then create a row for this markov state
        MarkovModel.create word: prev_word, next_word: word, count: 1
      end
      prev_word = word
    end

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def reverse_view_order
    @show_newest_first = !@show_newest_first
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :location, :posted_time, :ttl, :is_request)
    end
end
