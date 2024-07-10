require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET /show' do
    let(:user) { create(:user)}
    let(:profile) { user.profile }

    before do
      get :show, params: { id: profile.id }
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(:ok)
    end
  end
end
