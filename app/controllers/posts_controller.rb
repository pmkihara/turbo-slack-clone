class PostsController < ApplicationController
  before_action :set_post, except: %i[create]

  def show
    @channel = @post.channel
    @replies = @post.replies.includes(:user).with_rich_text_content.order(:created_at)
  end

  def create
    @postable = Channel.find(params[:channel_id]) if params[:channel_id]
    @postable = Post.find(params[:post_id]) if params[:post_id]

    @post = Post.new(post_params.merge(user: current_user, postable: @postable))
    if @post.save
      redirect_to @postable
    else
      flash.now.alert = flat_error_messages
      @channel = @post.channel
      render 'channels/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post.postable
    else
      @channel = @post.channel
      flash.now.alert = flat_error_messages
      render 'channels/show', status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash.now.notice = 'Post destroyed'
    redirect_to @post.postable
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def flat_error_messages
    @post.errors.messages.map { |k, v| "#{k.capitalize} #{v.join(', ')}" }.join(', ')
  end
end
