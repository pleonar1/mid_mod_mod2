class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.youngest_to_oldest
  end

  def update
    actor = Actor.find_by(:name => params[:name])
    movie = Movie.find(params[:id])
    actor_movie_join = movie.actor_movies.create(actor_id: actor.id)
    redirect_to "/movies/#{movie.id}"
  end

end
