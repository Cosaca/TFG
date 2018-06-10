class SectionsController < ApplicationController
    before_action :authenticate_teacher!
        
    def new
        @course = Course.find(params[:id])
        @section = Section.new
    end

    def show
        @section = Section.find(params[:id])
        @users = @section.users

        @users = @users.paginate(page: params[:page], :per_page => 10)

        # Cálculo de los gráficos de estadísticas
        @max_users = @section.users.order(completed_levels: :desc).first(5)
        @min_users = @section.users.order(completed_levels: :asc).first(5)
        @users_age = @section.users.group(:age).average(:completed_levels)
        @gender_levels = @section.users.group(:gender).sum(:completed_levels)
        @avg_users = @section.users.group(:completed_levels).average(:total_lines)

        @hash_user_max_levels = {}
        @hash_user_min_levels = {}
        
        @max_users.each do |stats|
            @hash_user_max_levels[stats.username] = stats.completed_levels
        end

        @min_users.each do |stats|
            @hash_user_min_levels[stats.username] = stats.completed_levels
        end

        respond_to do |format|
            format.html
            format.pdf {render template: 'sections/stats', pdf: 'Estadisticas', javascript_delay: 2000}
        end
    end

    def create
        @course = Course.find(params[:curso])

        @section = @course.sections.new(section_params)
        
        if @section.save
            flash[:success] = "La sección se ha creado con éxito"
            redirect_to @course
        else
            render :new
        end
    end

    # Método que lee el fichero en formato .json
    def upload
        @section = Section.find(params[:seccion])

        filename = params[:file].original_filename

        if filename.match(/\.json/)
            file = params[:file].read
            data = JSON.parse(file)
        
            data.each do |user|
                @user = User.new(first_name: user["name"]["first"], last_name: user["name"]["last"], username: user["username"], age: user["age"],
                gender: user["gender"], total_lines: user["total_lines"], completed_levels: user["completed_levels"], section_id: @section.id).save
            end
            
            flash[:success] = 'Los alumnos se añadieron correctamente'
            redirect_to @section and return
        else
            flash[:danger] = 'El formato del archivo es incorrecto. Debe ser con extensión .json'
            redirect_to @section and return
        end
    end

    def destroy
        @course = Course.find(params[:course_id])

        @sections = Section.find(params[:id]).destroy
        redirect_to @course, notice: "La sección se ha borrado con éxito"
    end

    private

    def section_params
        params.require(:section).permit(:name)
    end
end