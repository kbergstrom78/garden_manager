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
  
      # User Story 18 

      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to edit that child's info
      # When I click the link
      # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
    it "displays link to edit plant info from plant index page" do
      visit '/plants'
      save_and_open_page
      click_link "Update #{plant_3.name}"

      expect(current_path).to eq "/plants/#{plant_3.id}/edit"
    end
  end
end