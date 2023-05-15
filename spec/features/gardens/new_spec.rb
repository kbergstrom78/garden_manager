require "rails_helper"
# User Story 11

RSpec.describe "/gardens/new" do
  describe "as a visitor at the Garden Index page" do
    describe "I can create a new Garden Record" do      
      it "links to new page from garden index" do
        visit "/gardens"
        
        click_link "New Garden"
        expect(current_path).to eq("/gardens/new")

        fill_in 'name', with: "Alpine Garden"
        fill_in 'location', with: "Vail, CO"
        choose('plantable_true')
        fill_in 'plot', with: 4
        click_button 'Create Garden'
      
        expect(current_path).to eq("/gardens")
        expect(page).to have_content("Alpine Garden")
      end
    end
  end
end