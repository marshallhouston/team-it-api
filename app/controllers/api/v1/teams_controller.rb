class Api::V1::TeamsController < ApplicationController

  def index
    teams = Team.all
    options = {}
    options[:meta] = { total_teams: teams.length }
    render json: TeamSerializer.new(teams, options).serialized_json
  end

  def show
    team = Team.find_by(id: params[:id])
    if team
      render json: TeamSerializer.new(team).serialized_json
    else
      render json: {"Error": "Team not found"}, status: 404
    end
  end

end
