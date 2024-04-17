class PostsController < ApplicationController
  def create
    @channel = Channel.find(params[:channel_id])
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @channel }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:rich_content).merge(user: current_user, postable: @channel)
  end
end
