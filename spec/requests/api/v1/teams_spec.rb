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
end
