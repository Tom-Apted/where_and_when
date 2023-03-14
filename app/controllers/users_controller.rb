class UsersController < ApplicationController
    def show
        @user = current_user
      end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @user.update(user_params)
        redirect_to user_path(current_user)
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :gender, :date_preference1, :date_preference2, :date_preference3)
    end

end
