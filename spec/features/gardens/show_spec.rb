require "rails_helper"

# User Story 2 - Parent Show

RSpec.describe '/gardens/:id', type: :feature do
  let!(:garden_1) { Garden.create!(name:"Kew Garden", location: "London", plantable: true, plot: 65)  }
  let!(:garden_2) { Garden.create!(name:"2nd Grade Garden", location: "Mountain Elementary", plantable: true, plot: 3)  }
  let!(:garden_3) { Garden.create!(name:"Los Alamos Community Garden", location: "North Mesa", plantable: false, plot: 12)  }

  it "displays garden_1 and its attributes" do
    visit "/gardens/#{garden_1.id}"
    # save_and_open_page

    expect(page).to have_content(garden_1.name)
    expect(page).to have_content(garden_1.location)
    expect(page).to have_content(garden_1.plantable)
    expect(page).to have_content(garden_1.plot)
  end
    
  it "displays garden_2 and its attributes" do
    visit "/gardens/#{garden_2.id}"
    save_and_open_page
      
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
end