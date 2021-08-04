class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def avg_player_age
    teams.players.avg(:age)
  end
end
