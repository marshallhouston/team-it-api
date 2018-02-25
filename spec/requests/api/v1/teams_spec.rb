require 'rails_helper'

describe 'Teams API' do
  describe 'get /api/v1/teams' do
    it 'returns all teams as json' do
      teams = create_list(:team, 2)

      get '/api/v1/teams'

      parsed_data = JSON.parse(response.body)
      first_team = parsed_data['data'][0]

      expect(response).to be_success
      expect(first_team['id'].to_i).to eq teams[0].id
      expect(first_team['type']).to eq 'team'
      expect(first_team['attributes']['name']).to eq teams[0].name
      expect(first_team['attributes']['team_code']).to eq teams[0].team_code
      expect(parsed_data['meta']).to eq({ 'total_teams' => 2 })
    end
  end

  describe 'get /api/v1/teams/:id' do
    it 'returns the requested team as json' do
      teams = create_list(:team, 2)
      requested_team = teams.last
      get "/api/v1/teams/#{requested_team.id}"

      parsed_data = JSON.parse(response.body)
      team_info = parsed_data['data']

      expect(response).to be_success
      expect(team_info['id'].to_i).to eq requested_team.id
      expect(team_info['attributes']['name']).to eq requested_team.name
      expect(team_info['attributes']['team_code']).to eq requested_team.team_code
    end

    it 'returns 404 if the team does not exist' do
      get '/api/v1/teams/6'

      expect(response).to_not be_success
      expect(response.status).to eq 404
    end
  end

  describe 'post /api/v1/teams' do
    context 'valid attributes' do
      it 'creates a new team resource' do
        headers = { "CONTENT_TYPE" => "application/json" }
        expect {
          post "/api/v1/teams", params: '{"team": {"name": "Westwood Soccer"} }', headers: headers
        }.to change(Team, :count).by(1)

        parsed_team = JSON.parse(response.body)

        expect(response.status).to eq 201
        expect(parsed_team['data']['attributes']['name']).to eq "Westwood Soccer"
        expect(parsed_team['data']['attributes']['team_code']).to be
      end
    end
  end
end
