class MembershipsController < ApplicationController
  def create
    channel = Channel.find(params[:channel_id])
    @membership = Membership.new(user: current_user, channel:)
    if @membership.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to channel }
      end
    else
      render_alert('You are already a member of this channel')
    end
  end
end
