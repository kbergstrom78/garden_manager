require 'rails_helper'
      # User Story 13

RSpec.describe 'gardens/:garden_id/plants/new', type: :feature do
  describe 'as a visitor when i visit the gardens plants index page' do
    let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
    
    let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
    let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}
    
    it 'displays a link to add a new plant to the garden #Create Child' do
      visit "/gardens/#{garden_1.id}/plants"
      # save_and_open_page
      
      click_link "Create Plant"
      expect(current_path).to eq "/gardens/#{garden_1.id}/plants/new"
      fill_in "name", with: "basil"
      fill_in "plant_type", with: "herb"
      fill_in "water", with: "moderate"
      fill_in "light", with: "partial sun"
      choose ("poisonous_false")
      fill_in "zone", with: 6
      click_button 'Create Plant'
          
      # save_and_open_page

      expect(current_path).to eq "/gardens/#{garden_1.id}/plants"
      expect(page).to have_content("basil")
    end
  end
end