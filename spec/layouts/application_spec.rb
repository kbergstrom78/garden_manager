require "rails_helper"

RSpec.describe "application layout view", type: :feature do
    #User story 8

  describe "link to child index" do
    let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }

    let!(:plant_1) { garden_1.plants.create!(name: "geranium", plant_type: "annual", light: "partial sun", water: "moderate", poisonous: false, zone: "5" )}
    let!(:plant_2) { garden_1.plants.create!(name: "yarrow", plant_type: "perennial", light: "full sun", water: "low", poisonous: false, zone: "7" )}
    let!(:plant_3) { garden_1.plants.create!(name: "foxglove", plant_type: "biannual", light: "shade", water: "high", poisonous: true, zone: "6" )}

    it "can visit any page on the site and see the plant index link at the top" do
      visit "/plants"
      # save_and_open_page
      expect(page).to have_link("All Plants")

      click_link("All Plants")
      expect(current_path).to eq("/plants")

      visit "/plants/#{plant_1.id}"
      # save_and_open_page
      expect(page).to have_content("All Plants")

      click_link("All Plants")
      expect(current_path).to eq("/plants")
    end
    # User story 9
    it "can visit any page on the site and see the garden index" do
      visit "/gardens/#{garden_1.id}/plants"
      expect(page).to have_link("All Gardens")
      # save_and_open_page
      click_link("All Gardens")
      expect(current_path).to eq("/gardens")
    end
  end
end