require 'rails_helper'

describe 'Team Followers API' do
  describe 'post /api/v1/teams/:team_id/followers' do
    it 'creates a new follower for the team' do
      team = create(:team)
      headers = { "CONTENT_TYPE" => "application/json" }
      expect {
        post "/api/v1/teams/#{team.id}/followers", params: '{"follower": {"name": "Marshall Raymond", "phone": "555-555-5511", "email": "marshall@marshall.com"} }', headers: headers
      }.to change(team.users, :count).by(1)
      expect(response.status).to eq 201
    end

    context 'if a team does not exist' do
      it 'renders a 404 error' do
        post "/api/v1/teams/989/followers"
        expect(response.status).to eq 404
      end
    end
  end
end
