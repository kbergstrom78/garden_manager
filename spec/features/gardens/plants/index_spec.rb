require 'rails_helper'


RSpec.describe 'gardens/:garden_id/plants', type: :feature do
  describe 'as a visitor when i visit the gardens plants index page' do
    let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }

    let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
    let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}
      #User Story 5, Parent Children Index 
      it 'displays each garden and attributes associated with garden_1' do
      visit "/gardens/#{garden_1.id}/plants"
      save_and_open_page

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
    end
  end
end
