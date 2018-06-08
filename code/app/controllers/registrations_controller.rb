class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_update_path_for(teacher)
        '/courses'
    end

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email])
    end

    def sign_up_params
        params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end