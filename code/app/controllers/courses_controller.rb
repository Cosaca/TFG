class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        
        @courses = Course.find(params[:id])
    end

    def create
        @courses =  Course.new(title: params[:course][:title], body: params[:course][:body])
        
        if @courses.save
            redirect_to @courses
        else
            render :new
        end
    end

    def destroy
        @courses = Course.find(params[:id])
        @courses.destroy
        redirect_to courses_path
    end
end