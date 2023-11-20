class MoviesController < ApplicationController
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # Obtener todas las películas o filtrar por calificaciones seleccionadas
    @movies = Movie.all

    # Configurar las clasificaciones seleccionadas para que las casillas de verificación se muestren como marcadas
    @ratings_to_show = params[:ratings] || session[:ratings] || []

    # Obtener todas las clasificaciones posibles para construir las casillas de verificación
    @all_ratings = Movie.all_ratings

    # Verifica si no se pasaron parámetros de clasificación o filtrado en la URL
    if params[:sort_by].nil? && params[:ratings].nil?
      # Recupera las configuraciones de clasificación y filtrado desde session[]
      # Esto restaurará las configuraciones previas almacenadas en las cookies
      params[:sort_by] = session[:sort_by] if session[:sort_by].present?
      params[:ratings] = session[:ratings] if session[:ratings].present?

      # Redirige a la URL con las configuraciones almacenadas en session[]
      redirect_to movies_path(params)
      return
    end

    # Guarda las configuraciones de clasificación y filtrado en session[]
    session[:sort_by] = params[:sort_by]
    session[:ratings] = params[:ratings]

    # Verifica si se proporciona un orden y configura las variables de control
    if params[:order].present?
      @order_column = params[:order][:column]
      @order_direction = params[:order][:direction]
      @movies = @movies.order("#{@order_column} #{@order_direction}")
    end

    # Filtramos las películas por clasificaciones seleccionadas
    if params[:ratings].present?
      selected_ratings = params[:ratings].keys
      @movies = @movies.with_ratings(selected_ratings)
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
