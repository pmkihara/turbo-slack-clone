class ChannelsController < ApplicationController
  def index
    @channels = params[:name] ? search_channels(params[:name]) : nil
    @channel = Channel.new(name: params[:name], user: current_user)
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to @channel, notice: 'Channel successfully created'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @channel = Channel.find(params[:id])
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
