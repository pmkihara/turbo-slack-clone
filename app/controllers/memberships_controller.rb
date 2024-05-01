class MembershipsController < ApplicationController
  def create
    channel = Channel.find(params[:channel_id])
    @membership = Membership.new(user: current_user, channel:)
    if @membership.save
      respond_to do |format|
        format.html { redirect_to channel }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append(:channels, channel),
            turbo_stream.replace(:modal, '<turbo-frame id="modal"><turbo-frame>')
          ]
        end
      end
    else
      redirect_to root_path, alert: 'You are already a member of this channel'
    end
  end
end
