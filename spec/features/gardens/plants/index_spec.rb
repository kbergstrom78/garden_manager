require 'rails_helper'


RSpec.describe 'gardens/:garden_id/plants', type: :feature do
  describe 'as a visitor when i visit the gardens plants index page' do
    let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }

    let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: 5 )}
    let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: 7 )}
    let!(:plant_3) { garden_1.plants.create!(name: "aster", plant_type: "perennial", light: "partial sun", water: "moderate", poisonous: false, zone: 7 )}
    let!(:plant_4) { garden_1.plants.create!(name: "lily of the valley", plant_type: "bulb", light: "partial shade", water: "heavy", poisonous: true, zone: 4 )}
 
    it 'displays each garden and attributes associated with garden_1' do
      visit "/gardens/#{garden_1.id}/plants"

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
        # User Story 16, Sort Parent's Children in Alphabetical Order by name 

      # As a visitor
      # When I visit the Parent's children Index Page
      # Then I see a link to sort children in alphabetical order
      # When I click on the link
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
      it "displays plants on the garden/plants index page in alpha order" do
        visit "/gardens/#{garden_1.id}/plants"
        # save_and_open_page
        
        expect(page).to have_link("Sort Plants by Name")
        expect(plant_1.name).to appear_before(plant_2.name)
        
        click_link("Sort Plants by Name")

        expect(current_path).to eq "/gardens/#{garden_1.id}/plants" 
        expect(plant_3.name).to appear_before(plant_1.name)
        expect(plant_1.name).to appear_before(plant_4.name)
        expect(plant_4.name).to appear_before(plant_2.name)
      end
      # User Story 18

      it "displays link to edit plant info from plant index page" do
        visit "/gardens/#{garden_1.id}/plants" 
        # save_and_open_page

        click_link "Update #{plant_3.name}"
  
        expect(current_path).to eq "/plants/#{plant_3.id}/edit"
      end
    end

      # User Story 21, Display Records Over a Given Threshold 

      # As a visitor
      # When I visit the Parent's children Index Page
      # I see a form that allows me to input a number value
      # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
      # Then I am brought back to the current index page with only the records that meet that threshold shown.
    describe  'filter quantities of plants' do
      let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
      let!(:garden_2) { Garden.create!(name:"2nd Grade Garden", location: "Mountain Elementary", plantable: true, plot: 3)  }
      let!(:garden_3) { Garden.create!(name:"Los Alamos Community Garden", location: "North Mesa", plantable: false, plot: 12)  }
      
      let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: true, zone: "5" )}
      let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: true, zone: "7" )}
      let!(:plant_3) { garden_1.plants.create!(name: "foxglove", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}
      let!(:plant_4) { garden_1.plants.create!(name: "tomato", plant_type: "veggie", light: "full sun", water: "moderate", poisonous: true, zone: "5" )}  
    
      it 'displays a form to enter quantities' do
        visit "/gardens/#{garden_1.id}/plants" 
        # save_and_open_page
        expect(page).to have_content("Quantity")
      end

      it 'filters plants by quantity' do
        visit "/gardens/#{garden_1.id}/plants" 
        # save_and_open_page
        fill_in "quantity_#{plant_1.id}", with: 16
        fill_in "quantity_#{plant_2.id}", with: 2
        fill_in "quantity_#{plant_3.id}", with: 11
        fill_in "quantity_#{plant_4.id}", with: 6
        click_button 'Only return records with more than 8 of plant quantity'

        expect(current_path).to eq "/gardens/#{garden_1.id}/plants/filter"
        expect(page).to have_content(plant_1.name)
        expect(page).to have_content(plant_2.name)
      end



    
  end
end
