require 'rails_helper'

RSpec.describe 'The Competition show page' do
  before :each do
    @team1 = Team.create!(hometown: 'Home 1', nickname: 'Nickname 1')
    @team2 = Team.create!(hometown: 'Home 2', nickname: 'Nickname 2')
    @team3 = Team.create!(hometown: 'Home 3', nickname: 'Nickname 3')
    @player1 = @team1.players.create!(name: 'Player 1', age: 20)
    @player2 = @team1.players.create!(name: 'Player 2', age: 18)
    @player3 = @team2.players.create!(name: 'Player 3', age: 20)
    @player4 = @team2.players.create!(name: 'Player 4', age: 22)
    @competition1 = Competition.create!(name:'Comp1', location:'location1', sport:'baseball')
    @competition2 = Competition.create!(name:'Comp2', location:'location2', sport:'basketball')
    @competition1.teams << @team1
    @competition1.teams << @team2
    @competition2.teams << @team3

    visit "/competitions/#{@competition1.id}"
  end

  describe 'user story 2' do
    it "displays the competition's name, location and sport" do
      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)
      expect(page).to_not have_content(@competition2.name)
      expect(page).to_not have_content(@competition2.location)
      expect(page).to_not have_content(@competition2.sport)
    end

    it "displays the nickname and hometown of all teams in this competition" do
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to_not have_content(@team3.nickname)
      expect(page).to_not have_content(@team3.hometown)
    end

    xit "displays the average age of all players in the competition" do
      require "pry"; binding.pry
      expect(page).to have_content("Average age of all players: #{@competition1.avg_player_age}")
    end
  end

  describe 'user story 3 - Register a Team' do
    it "displays a link to register a new team" do
      expect(page).to have_link("Register a new team")

      click_link("Register a new team")

      expect(page).to have_current_path("/competitions/#{@competition1.id}/teams/new")
    end
  end
end
