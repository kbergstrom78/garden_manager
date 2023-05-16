require "rails_helper"

# User story 3

RSpec.describe "/plants", type: :feature do
  describe "as a visitor, when I visit plants index page" do
    let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
    let!(:garden_2) { Garden.create!(name:"2nd Grade Garden", location: "Mountain Elementary", plantable: true, plot: 3)  }
    
    let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
    let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}
    let!(:plant_3) { garden_1.plants.create!(name: "foxglove", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}
    let!(:plant_1) { garden_2.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
    let!(:plant_4) { garden_1.plants.create!(name: "tomato", plant_type: "veggie", light: "full sun", water: "moderate", poisonous: false, zone: "5" )}  
    
    xit "displays the names of all the plants and their attributes" do
      visit "/plants"
      # save_and_open_page

      expect(page).to have_content(plant_1.name)
      expect(page).to have_content(plant_1.plant_type)
      expect(page).to have_content(plant_1.water)
      expect(page).to have_content(plant_1.light)
      expect(page).to have_content(plant_1.poisonous)
      expect(page).to have_content(plant_1.zone)
      expect(page).to have_content(plant_2.name)
      expect(page).to have_content(plant_2.plant_type)
      expect(page).to have_content(plant_2.water)
      expect(page).to have_content(plant_2.light)
      expect(page).to have_content(plant_2.poisonous)
      expect(page).to have_content(plant_2.zone)
      expect(page).to have_content(plant_3.name)
      expect(page).to have_content(plant_3.plant_type)
      expect(page).to have_content(plant_3.water)
      expect(page).to have_content(plant_3.light)
      expect(page).to have_content(plant_3.poisonous)
      expect(page).to have_content(plant_3.zone)
    end
  
  
      # User Story 15, 

      # As a visitor
      # When I visit the child index
      # Then I only see records where the boolean column is `true`
  
      it "only displays records where poisonous = true" do
        visit '/plants'

        expect(page).to_not have_content(plant_1.name)
        expect(page).to have_content(plant_3.name)
        expect(page).to have_content(plant_3.plant_type)
        expect(page).to have_content(plant_3.water)
        expect(page).to have_content(plant_3.light)
        expect(page).to have_content(plant_3.poisonous)
        expect(page).to have_content(plant_3.zone)


      end
  end
end