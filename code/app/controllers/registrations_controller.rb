class RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
        params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    protected 

    def update_resource(resource, params)
        resource.update_without_password(params)
    end
end