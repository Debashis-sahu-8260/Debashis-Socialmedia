class UsersController < Devise::RegistrationsController
    private

    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :avatar, :gender)
    end

    
    def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar, :gender)
    end
end
