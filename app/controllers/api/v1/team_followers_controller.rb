class Api::V1::TeamFollowersController < ApplicationController

  def create
    if find_team
      @team.users << find_follower
      render json: {"Message": "#{@team.name} added a new follower - #{@user.name}"}, status: :created
    else
      render json: {"Error": "Team not found"}, status: :not_found
    end
  end

    private

    def find_team
      @team ||= Team.find_by(id: params[:team_id])
    end

    def find_follower
      @user ||= User.find_or_create_by(email: follower_params[:email]) do |user|
        user.name = follower_params[:name]
        user.phone = follower_params[:phone]
      end
    end

    def follower_params
      params.require(:follower).permit(:name, :phone, :email)
    end
end
