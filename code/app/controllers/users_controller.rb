class UsersController < ApplicationController
    before_action :authenticate_teacher!
    
    def new
        @course = Course.find(params[:id])
        @user = User.new
    end

    def create
        @course = Course.find(params[:curso])

        @user = @course.users.new(user_params)

        if @user.save
            redirect_to :courses, notice: "El usuario se ha creado con éxito"
        else
            render :new
        end
    end

    def destroy
        @users = User.find(params[:id]).destroy
        redirect_to :courses, notice: "El alumno se ha borrado con éxito"
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :completed_levels, :total_lines, :age)
    end
end
