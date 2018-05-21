class StatsController < ApplicationController
    def index
        @courses = Course.find(params[:id])
        @stats = @courses.users
    end
end