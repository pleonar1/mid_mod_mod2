require 'rails_helper'

RSpec.describe 'Movie show page' do
  describe 'when I visit the movie show page' do
    it "has all movie attributes, and lists all actors young to old. It also has the average age of actors" do
      studio = Studio.create!(name: "pauls studio", location: "georgia")
      movie = studio.movies.create!(title: "Paul's Movie", creation_year: 1984, genre: "Horror")
      actor1 = movie.actors.create!(name: "mike", age: 29)
      actor2 = movie.actors.create!(name: "Paul", age: 28)
      actor3 = movie.actors.create!(name: "dani", age: 30)

      visit "/movies/#{movie.id}"

      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.creation_year)
      expect(page).to have_content(movie.genre)
      expect(actor2).to appear_before(actor1)
      expect(actor1).to appear_before(actor3)
      expect(page).to have_content("Actors' average age: 29")
    end
  end
end
