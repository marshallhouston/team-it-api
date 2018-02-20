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
      expect(first_team['attributes']['phone']).to eq teams[0].phone
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
      expect(team_info['attributes']['phone']).to eq requested_team.phone
    end

    it 'returns 404 if the team does not exist' do
      get '/api/v1/teams/6'

      expect(response).to_not be_success
      expect(response.status).to eq 404
    end
  end
end
