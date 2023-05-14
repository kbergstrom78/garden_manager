require "rails_helper"

RSpec.describe Garden, type: :model do
  describe "relationships" do
    it { should have_many :plants }
  end
end