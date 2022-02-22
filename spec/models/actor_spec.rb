require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }

  end

  describe 'class methods' do
    it "it will order all actors from youngest to oldest" do
      actor1 = Actor.create!(name: "Paul", age: 28)
      actor2 = Actor.create!(name: "Mike", age: 32)
      actor3 = Actor.create!(name: "Dani", age: 30)
      actor4 = Actor.create!(name: "Craig", age: 44)
      actor5 = Actor.create!(name: "My mom", age: 62)

      expect(Actor.youngest_to_oldest).to eq([actor1, actor3, actor2, actor4, actor5])
    end
  end
end
