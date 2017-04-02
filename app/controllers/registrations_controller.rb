class RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
	  beta_keys = BetaKey.all.pluck(:beta_key)
    if params[:beta_key] and beta_keys.include? params[:beta_key]
      super
    else
			return render_create_error_beta_key_invalid 
		end
  end

  def render_create_error_beta_key_invalid
	  render json: {
      status: 'error',
      errors: ["Beta key is not valid"]
    }, status: 422
	end

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation, :beta_key)
  end
end
