class ChannelsController < ApplicationController
  def index
    @channels = params[:name] ? search_channels(params[:name]) : nil
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: 'Channel successfully created' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @posts = @channel.posts.includes(:user).with_rich_text_rich_content.order(:created_at)
    @post = Post.new
  end

  private

  def search_channels(name)
    Channel.where('name ILIKE ?', "%#{name}%")
  end

  def channel_params
    params.require(:channel).permit(:name, :description).merge(user: current_user)
  end
end
