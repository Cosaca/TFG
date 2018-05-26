class SectionsController < ApplicationController
    before_action :authenticate_teacher!
    
    def new
        @course = Course.find(params[:id])
        @section = Section.new
    end

    def show
        @sections = Section.find(params[:id])
        @users = @sections.users
    end

    def create
        @course = Course.find(params[:curso])

        @section = @course.sections.new(section_params)
        
        if @section.save
            redirect_to @course, notice: "La sección se ha creado con éxito"
        else
            render :new
        end
    end

    def destroy
        @course = Course.find(params[:course_id])
        @section = Section.find(params[:course_id])

        @sections = Section.find(params[:id]).destroy
        redirect_to @course, notice: "La sección se ha borrado con éxito"
    end

    private

    def section_params
        params.require(:section).permit(:name)
    end
end