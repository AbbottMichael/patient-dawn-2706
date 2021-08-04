require 'rails_helper'

RSpec.describe 'The Competition index page' do
  before :each do
    @competition1 = Competition.create!(name:'Comp1', location:'location1', sport:'baseball')
    @competition2 = Competition.create!(name:'Comp2', location:'location2', sport:'basketball')

    visit "/competitions"
  end

  describe 'user story 1' do
    it "displays the names of all of the competitions" do
      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition2.name)
    end

    it "displays each competition name as a link to it's show page" do
      click_link(@competition1.name)
      expect(page).to have_current_path("/competitions/#{@competition1.id}")

      visit "/competitions"

      click_link(@competition2.name)
      expect(page).to have_current_path("/competitions/#{@competition2.id}")
    end
  end
end
