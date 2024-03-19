class ChannelsController < ApplicationController
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

  private

  def channel_params
    params.require(:channel).permit(:name, :description).merge(user: current_user)
  end
end
