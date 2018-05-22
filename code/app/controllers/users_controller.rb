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
            flash.now[:success] = "El usuario se ha creado con éxito"
            redirect_to @course
        else
            render :new
        end
    end

    def destroy
        @course = Course.find(params[:course_id])

        @users = User.find(params[:id]).destroy
        redirect_to @course, notice: "El alumno se ha borrado con éxito"
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :completed_levels, :total_lines, :age, :gender, :username)
    end
end
