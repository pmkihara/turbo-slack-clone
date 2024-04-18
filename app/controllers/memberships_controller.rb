class MembershipsController < ApplicationController
  def create
    channel = Channel.find(params[:channel_id])
    @membership = Membership.new(user: current_user, channel:)
    if @membership.save
      redirect_to channel
    else
      redirect_to root_path, alert: 'You are already a member of this channel'
    end
  end
end
