require 'rails_helper'

describe 'Team Followers API' do
  describe 'post /api/v1/teams/:team_id/followers' do
    it 'creates a new follower for the team' do
      team = create(:team)
      headers = { "CONTENT_TYPE" => "application/json" }
      expect {
        post "/api/v1/teams/#{team.id}/followers", params: '{"follower": {"name": "Marshall Raymond", "phone": "555-555-5511", "email": "marshall@marshall.com"} }', headers: headers
      }.to change(team.users, :count).by(1)

      parsed_info = JSON.parse(response.body)

      expect(response.status).to eq 201
      expect(parsed_info['included'][0]['attributes']['name']).to eq 'Marshall Raymond'
      expect(parsed_info['included'][0]['attributes']['phone']).to eq '+15555555511'
      expect(parsed_info['included'][0]['attributes']['email']).to eq 'marshall@marshall.com'
    end

    context 'if a team does not exist' do
      it 'renders a 404 error' do
        post "/api/v1/teams/989/followers"
        expect(response.status).to eq 404
      end
    end

    context 'if a follower has an incorrectly formatted number' do
      it 'returns a 404 error' do
        team = create(:team)
        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/teams/#{team.id}/followers", params: '{"follower": {"name": "Marshall Raymond", "phone": "555-555-551", "email": "marshall@marshall.com"} }', headers: headers

        expect(response.status).to eq 404
      end
    end
  end
end
