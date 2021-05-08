require 'rails_helper'

RSpec.describe "Api::V1::Healths", type: :request do
  describe "GET /" do
    it 'responses with health status' do
      get "/api/v1/health"

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res.dig('data', 'attributes', 'status')).to eq('fine')
    end
  end
end
