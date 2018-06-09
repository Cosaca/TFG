class CoursesController < ApplicationController
    before_action :authenticate_teacher!
    
    def index
        @teacher = Teacher.find(current_teacher.id)
        @courses = @teacher.courses
    end

    def show
        @courses = Course.find(params[:id])
        @sections = @courses.sections

        @users = @courses.users

        # Cálculo de los gráficos de estadísticas
        @max_users = @courses.users.order(completed_levels: :desc).first(5)
        @min_users = @courses.users.order(completed_levels: :asc).first(5)
        @users_age = @courses.users.group(:age).average(:completed_levels)
        @gender_levels = @courses.users.group(:gender).sum(:completed_levels)
        @avg_users = @courses.users.group(:completed_levels).average(:total_lines)

        @hash_user_max_levels = {}
        @hash_user_min_levels = {}
        
        @max_users.each do |stats|
            @hash_user_max_levels[stats.username] = stats.completed_levels
        end

        @min_users.each do |stats|
            @hash_user_min_levels[stats.username] = stats.completed_levels
        end
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
        flash[:success] = "Tu curso ha sido borrado con éxito"
        redirect_to :courses 
    end

    private

    def set_article
        @courses = Course.find(params[:id])
    end
    
    def course_params
        params.require(:course).permit(:title,:body)
    end 
end