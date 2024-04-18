class PostsController < ApplicationController
  def create
    @channel = Channel.find(params[:channel_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to @channel
    else
      message = @post.errors.messages.map { |k, v| "#{k.capitalize} #{v.join(', ')}" }.join(', ')
      flash.now.alert = message
      render 'channels/show', status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content).merge(user: current_user, postable: @channel)
  end
end
