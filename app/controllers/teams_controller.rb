class TeamsController < ApplicationController

  def new
  end

  def create
    adopt_app = Team.new(adopt_app_params)
    adopt_app.save
    redirect_to "/competitions/#{params[:id]}"
  end

  private

  def team_params
    params.permit(:nickname, :hometown, )
  end
end
