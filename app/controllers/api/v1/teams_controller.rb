class Api::V1::TeamsController < ApplicationController

  def index
    teams = Team.all
    options = {}
    options[:meta] = { total_teams: teams.length }
    render json: TeamSerializer.new(teams, options).serialized_json
  end

end
