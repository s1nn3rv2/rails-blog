require "rails_helper"

RSpec.describe "LoginModal", type: :request do
  let(:user) { create(:user) }
  describe "GET /users/exists" do
    it "should exist" do
      @should_equal = { exists: true }

      post users_exists_path, params: { user: user }, as: :json
      expect(response).to be_successful
      expect(response.body).to eq(@should_equal.to_json)
    end

    it "should not exist" do
      @should_equal = { exists: false }
      post users_exists_path, params: { user: { email: "trash@junk.com" } }, as: :json
      expect(response).to be_successful
      expect(response.body).to eq(@should_equal.to_json)
    end
  end

end