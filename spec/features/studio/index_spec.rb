require 'rails_helper'

RSpec.describe "Studios Index Page" do
  describe "When I visit the studios index, " do
    it "I see each studios name and location, and under each studio it has all the movies associated with it" do
      studio1 = Studio.create!(name: "Paul's Studio", location: "Georgia")
      studio2 = Studio.create!(name: "Mike's Studio", location: "Colorado")

      movie1 = studio1.movies.create!(title: "Paul Movie 1", creation_year: 1984, genre: "horror")
      movie2 = studio1.movies.create!(title: "Paul Movie 2", creation_year: 1988, genre: "horror")
      movie3 = studio2.movies.create!(title: "Star Trek", creation_year: 1964, genre: "yellow shirt horror")

      visit "/studios"

      expect(studio2.name).to appear_before(studio1.name)
      expect(movie3.title).to appear_before(studio1.name)
      expect(studio1.name).to appear_before(movie2.title)
      expect(studio1.name).to appear_before(movie1.title)

      expect(page).to have_content(studio1.location)
      expect(page).to have_content(studio2.location)
    end
  end
end
