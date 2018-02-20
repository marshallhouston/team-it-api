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

  def create
    team = Team.new(new_team_params)

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

    def new_team_params
      # for proof of concept/proper rendering via client, I'm generating a random phone number.
      # this is where the Twilio service will create a # for the team and then save it in the db.
      phone_number = {phone: Faker::PhoneNumber.phone_number }
      team_params.merge(phone_number)
    end
end
