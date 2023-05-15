require "rails_helper"

# User story 1

RSpec.describe "/gardens", type: :feature do
  describe "as a visitor when I visit the gardens index page" do
    let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
    let!(:garden_2) { Garden.create!(name:"2nd Grade Garden", location: "Mountain Elementary", plantable: true, plot: 3)  }
    let!(:garden_3) { Garden.create!(name:"Los Alamos Community Garden", location: "North Mesa", plantable: false, plot: 12)  }

    it "displays all the names of all the gardes" do
      visit "/gardens"
      # save_and_open_page

      expect(page).to have_content(garden_1.name)
      expect(page).to have_content(garden_2.name)
      expect(page).to have_content(garden_3.name)
    end
  
    # User Story 6

    it "displays all the names of the gardens in descending order, and when they were created" do
      visit "/gardens"
      save_and_open_page
      
      expect(garden_2.name).to appear_before(garden_1.name)
      expect(garden_3.name).to appear_before(garden_2.name)
      expect(page).to have_content(garden_1.created_at)
    end
  end
end