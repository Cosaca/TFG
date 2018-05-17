class UsersController < ApplicationController
    before_action :authenticate_teacher!

    def show
        @users = User.find(params[:id])
    end
    
    def new
        @users = User.new
    end

    def create
        @users = current_teacher.users.new(user_params)
        
        if @users.save
            redirect_to :courses, notice: "El usuario se ha creado con éxito"
        else
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :total_lines, :completed_levels)
    end
end
