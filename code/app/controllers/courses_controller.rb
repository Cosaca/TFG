class CoursesController < ApplicationController
    before_action :authenticate_teacher!
    
    def index
        @teacher = Teacher.find(current_teacher.id)
        @courses = @teacher.courses
    end

    def show
        @courses = Course.find(params[:id])
        @sections = @courses.sections
    end

    def new
        @courses = Course.new
    end

    def create
        @courses = current_teacher.courses.new(course_params)
        
        if @courses.save
            redirect_to :courses, notice: "El curso se ha creado con éxito"
        else
            render :new
        end
    end

    def edit
        @courses = Course.find(params[:id])
    end

    def update
        @courses = Course.find(params[:id])

        if @courses.update(course_params)
            redirect_to @courses
        else
            render :new
        end
    end

    def destroy
        @courses = Course.find(params[:id]).destroy
        redirect_to :courses, notice: "Tu curso ha sido borrado con éxito"
    end

    private

    def set_article
        @courses = Course.find(params[:id])
    end
    
    def course_params
        params.require(:course).permit(:title,:body)
    end 
end