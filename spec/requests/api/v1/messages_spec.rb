require 'rails_helper'

describe 'Messages API' do
  context 'GET /api/v1/messages' do
    it 'receives a message with a from, to, and body field' do
      VCR.use_cassette('TwilioNewMessage') do
        headers = { "CONTENT_TYPE" => "application/json" }
        post '/api/v1/messages', params: '{"Body": "1 Team" }', headers: headers

        expect(response.status).to eq 204
      end
    end
  end
end
