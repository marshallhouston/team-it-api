class Api::V1::TeamFollowersController < ApplicationController

  def create
    if find_team && find_follower
      @team.users << find_follower
      options = {}
      options[:include] = [:users]
      options[:meta] = {message: "#{@team.name} added a new follower - #{@user.name}"}
      render json: TeamSerializer.new(@team, options).serialized_json, status: :created
    elsif !find_team
      render json: {"Error": "Team not found"}, status: :not_found
    else
      render json: {"Error": "User info is incorrect. Check phone number for xxx-xxx-xxxx format."}, status: :not_found
    end
  end

    private

    def find_team
      @team ||= Team.find_by(id: params[:team_id])
    end

    def find_follower
      @phone_number ||= PhoneFormatterService.format_number(follower_params[:phone])
      if Phony.plausible?(@phone_number)
        @user ||= User.find_or_create_by(email: follower_params[:email]) do |user|
          user.name = follower_params[:name]
          user.phone = @phone_number
        end
      else
        false
      end
    end

    def follower_params
      params.require(:follower).permit(:name, :phone, :email)
    end
end
