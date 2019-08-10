require 'rails_helper'

describe "#POST to create a message" do
    it "returns invalid request when a bad api key is sent" do
      person = FactoryBot.create(:person)
      search_string = "diapers"

      get "/api/v1/messages=#{search_type}&q=#{search_string}"

      search_response = JSON.parse(response.body)

      expect(search_response['results']).to eq('success')
    end

  end
end