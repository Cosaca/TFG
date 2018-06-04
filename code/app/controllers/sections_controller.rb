class SectionsController < ApplicationController
    before_action :authenticate_teacher!
        
    def new
        @course = Course.find(params[:id])
        @section = Section.new
    end

    def show
        @section = Section.find(params[:id])
        @users = @section.users

        @users = @users.paginate(page: params[:page], :per_page => 20)

        # Cálculo de los gráficos de estadísticas
        @hash_ages = {}
        @hash_levels = {}

        @users.each do |stats|
            @hash_ages[stats.age] = stats.total_lines
            @hash_levels[stats.username] = stats.completed_levels
        end

        puts @hash_ages

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

        file = params[:file].read
        data = JSON.parse(file)
        
        data.each do |user|
            @user = User.new(first_name: user["name"]["first"], last_name: user["name"]["last"], username: user["username"], age: user["age"],
            gender: user["gender"], total_lines: user["total_lines"], completed_levels: user["completed_levels"], section_id: @section.id).save
        end
        
        flash[:notice] = 'Los alumnos se añadieron correctamente'
        redirect_to @section and return
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