class Api::V1::TeamsController < ApplicationController

  def index
    teams = Team.all
    options = {}
    options[:meta] = { total_teams: teams.length }
    render json: TeamsSerializer.new(teams, options).serialized_json
  end

  def show
    team = Team.find_by(id: params[:id])
    options = {}
    options[:include] = [:users]
    if team
      render json: TeamSerializer.new(team, options).serialized_json
    else
      render json: {"Error": "Team not found"}, status: :not_found
    end
  end

  def create
    team = Team.new(team_params)
    team.generate_team_code

    if team.save
      render json: TeamSerializer.new(team).serialized_json, status: :created
    else
      render json: team.errors, status: 400
    end
  end

    private

    def team_params
      params.require(:team).permit(:name)
    end

end
