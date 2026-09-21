class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Integrity: every page requires an authenticated admin (Google OAuth).
  before_action :authenticate_admin!
end
