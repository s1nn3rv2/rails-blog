require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "is successful" do
      get "/"
      expect(response).to be_successful
    end
  end
  describe "GET /about" do
    it "is successful" do
      get "/about"
      expect(response).to be_successful
    end
  end
end
