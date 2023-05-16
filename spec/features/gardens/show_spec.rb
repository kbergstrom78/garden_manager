require "rails_helper"

# User Story 2 - Parent Show

RSpec.describe '/gardens/:id', type: :feature do
  let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
  let!(:garden_2) { Garden.create!(name:"2nd Grade Garden", location: "Mountain Elementary", plantable: true, plot: 3)  }
  let!(:garden_3) { Garden.create!(name:"Los Alamos Community Garden", location: "North Mesa", plantable: false, plot: 12)  }
  
  let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
  let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}
  let!(:plant_3) { garden_1.plants.create!(name: "foxglove", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}
  let!(:plant_4) { garden_1.plants.create!(name: "tomato", plant_type: "veggie", light: "full sun", water: "moderate", poisonous: false, zone: "5" )}  

  it "displays garden_1 and its attributes" do
    visit "/gardens/#{garden_1.id}"

    expect(page).to have_content(garden_1.name)
    expect(page).to have_content(garden_1.location)
    expect(page).to have_content(garden_1.plantable)
    expect(page).to have_content(garden_1.plot)
  end
    
  it "displays garden_2 and its attributes" do
    visit "/gardens/#{garden_2.id}"
      
    expect(page).to have_content(garden_2.name)
    expect(page).to have_content(garden_2.location)
    expect(page).to have_content(garden_2.plantable)
    expect(page).to have_content(garden_2.plot)
  end
    
  it "displays garden_3 and its attributes" do
    visit "/gardens/#{garden_3.id}"
      
    expect(page).to have_content(garden_3.name)
    expect(page).to have_content(garden_3.location)
    expect(page).to have_content(garden_3.plantable)
    expect(page).to have_content(garden_3.plot)
  end

  # User Story 7

  it "displays a count of the number of plants associated with the garden" do
    visit "/gardens/#{garden_1.id}"

    expect(page).to have_content("Number of Plants: #{garden_1.plants.size}")
  end

  # User Story 10

  it "displays a link to take me to the gardens-plants page" do
    visit "/gardens/#{garden_1.id}"


    expect(page).to have_link("Plants in this Garden")
    click_link("Plants in this Garden")
    expect(page.current_path).to eq "/gardens/#{garden_1.id}/plants"
  end 

  # User Story 12

    it "displays a link to 'Update Garden" do
      visit "/gardens/#{garden_1.id}"

      click_link("Update Garden Info")
      expect(page.current_path).to eq "/gardens/#{garden_1.id}/edit"

      fill_in 'name', with: "Alpine Garden"
      fill_in 'location', with: "Vail, CO"
      choose('plantable_true')
      fill_in 'plot', with: 4
      click_button 'Update Garden Info'

      expect(current_path).to eq "/gardens/#{garden_1.id}"
      expect(page).to have_content("Alpine Garden")
    end
end