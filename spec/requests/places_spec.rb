require 'rails_helper'

RSpec.describe "Places", type: :request do
  let(:api_url) { 'http://localhost:3000/places'}
    it 'return all places' do
      response = Net::HTTP.get_response(URI(api_url))
      expect(response.code).to eq('200')

      body = JSON.parse(response.body)
      expect(body).to be_instance_of(Array)
      expect(body.first).to include('id', 'coordinates', 'name', 'kinds', 'rate')
    end
end
