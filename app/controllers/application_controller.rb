class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    additional_fields = %i[display_name full_name title image_url]

    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: additional_fields)

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: additional_fields)
  end

  def render_notice(message)
    render turbo_stream: turbo_stream.replace('flashes', partial: 'shared/flashes', locals: { notice: message })
  end

  def render_alert(message)
    render turbo_stream: turbo_stream.replace('flashes', partial: 'shared/flashes', locals: { alert: message })
  end
end
