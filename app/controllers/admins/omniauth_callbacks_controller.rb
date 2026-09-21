class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    admin = Admin.from_google(request.env["omniauth.auth"])

    if admin.present? && admin.persisted?
      sign_out_all_scopes
      flash[:notice] = "Successfully authenticated from Google account."
      sign_in_and_redirect admin, event: :authentication
    else
      flash[:alert] = "There was a problem signing in with Google."
      redirect_to new_admin_session_path
    end
  end

  def failure
    flash[:alert] = "Google sign in was cancelled or failed."
    redirect_to new_admin_session_path
  end
end
