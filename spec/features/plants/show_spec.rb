require 'rails_helper'
# User story 4

RSpec.describe "/plants/:id", type: :feature do
  let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
  let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
  let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}

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
#    As a visitor
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
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

end