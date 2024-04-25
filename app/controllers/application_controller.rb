class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_channels

  def configure_permitted_parameters
    additional_fields = %i[display_name full_name title image_url]

    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: additional_fields)

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: additional_fields)
  end

  private

  def set_channels
    return unless current_user

    @channels = current_user.channels.order(:name) || []
  end
end
