class UsersController < ApplicationController
    before_action :authenticate_teacher!
    
    def new
        @section = Section.find(params[:id])
        @user = User.new
    end

    def create
        @section = Section.find(params[:seccion])

        @user = @section.users.new(user_params)

        if @user.save
            flash[:success] = "El usuario se ha creado con éxito"
            redirect_to @section
        else
            render :new
        end
    end

    def destroy
        @section = Section.find(params[:section_id])

        @users = User.find(params[:id]).destroy
        flash[:success] = "El alumno se ha borrado con éxito"
        redirect_to @section
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :completed_levels, :total_lines, :age, :gender, :username)
    end
end
