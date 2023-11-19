class MoviesController < ApplicationController
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # Obtener todas las películas o filtrar por calificaciones seleccionadas
    @movies = params[:ratings] ? Movie.with_ratings(params[:ratings].keys) : Movie.all

    # Configurar las clasificaciones seleccionadas para que las casillas de verificación se muestren como marcadas
    @ratings_to_show = params[:ratings]&.keys

    # Obtener todas las clasificaciones posibles para construir las casillas de verificación
    @all_ratings = Movie.all_ratings

      # Verifica si se proporciona un orden y configura las variables de control
      if params[:order].present?
        @order_column = params[:order][:column]
        @order_direction = params[:order][:direction]
        @movies = @movies.order("#{@order_column} #{@order_direction}")
      end
  end 

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end



end
