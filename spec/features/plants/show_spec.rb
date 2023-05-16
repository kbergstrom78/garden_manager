require 'rails_helper'
# User story 4

RSpec.describe "/plants/:id", type: :feature do
  let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
  let!(:garden_2) { Garden.create!(name:"2nd Grade Garden", location: "Mountain Elementary", plantable: true, plot: 3)  }
  let!(:garden_3) { Garden.create!(name:"Los Alamos Community Garden", location: "North Mesa", plantable: false, plot: 12)  }
  
  
  let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
  let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}
  let!(:plant_3) { garden_1.plants.create!(name: "foxglove1", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}
  let!(:plant_4) { garden_2.plants.create!(name: "foxglove2", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}
  let!(:plant_5) { garden_2.plants.create!(name: "foxglove3", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}
  let!(:plant_6) { garden_2.plants.create!(name: "foxglove4", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}

  it 'displays the specific plant with its attributes' do
    visit "/plants/#{plant_1.id}"


    expect(page).to have_content(plant_1.name)
    expect(page).to have_content(plant_1.plant_type)
    expect(page).to have_content(plant_1.water)
    expect(page).to have_content(plant_1.light)
    expect(page).to have_content(plant_1.poisonous)
    expect(page).to have_content(plant_1.zone)
  end

  it 'displays plant_2 information' do
    visit "/plants/#{plant_2.id}" 
        
    expect(page).to have_content(plant_2.name)
    expect(page).to have_content(plant_2.plant_type)
    expect(page).to have_content(plant_2.water)
    expect(page).to have_content(plant_2.light)
    expect(page).to have_content(plant_2.poisonous)
    expect(page).to have_content(plant_2.zone)
  end

  # User Story 14

  it "diplays a link to 'Update Plant'" do
    visit "/plants/#{plant_1.id}"

    click_link("Update Plant")
    expect(page.current_path).to eq "/plants/#{plant_1.id}/edit"
    
    fill_in "name", with: "basil"
    fill_in "plant_type", with: "herb"
    fill_in "water", with: "moderate"
    fill_in "light", with: "partial sun"
    choose ("poisonous_false")
    fill_in "zone", with: 6
    click_button 'Update Plant'

    expect(current_path).to eq "/plants/#{plant_1.id}"
    expect(page).to have_content("herb")
  end

      # User Story 20, Child Delete 
    it 'displays a link to delete a plant record' do
      visit "/plants/#{plant_3.id}"
      save_and_open_page
      click_button "Delete #{plant_3.name}"
      
      expect(current_path).to eq("/plants")
      expect(page).to_not have_content(plant_3.name)
    end


end