class UsersController < ApplicationController
    before_action :find_user, only: [:show]
    before_action :test, only: [:index, :show]

    def index 
        @users = User.where(user_role: true)
    end

    def show
    end

    def edit  
    end

    def update
        @user = User.update(user_params)

        redirect_back(fallback_location: root_path)
    end

    
    private
    
    def find_user
        @user = User.find(params[:id])
    end
    
    def test
        if current_user.test_user_role? or current_user.director? or current_user.admin?
          true
        else
          redirect_back(fallback_location: root_path)
        end
      end

    def user_params
        params.require(:user).permit(:avatar)
    end
end
