class SectionsController < ApplicationController
    before_action :authenticate_teacher!
    
    def new
        @course = Course.find(params[:id])
        @section = Section.new
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
        @section = Section.find(params[:course_id])

        @sections = Section.find(params[:id]).destroy
        redirect_to @course, notice: "La sección se ha creado con éxito"
    end

    private

    def section_params
        params.require(:section).permit(:name)
    end
end