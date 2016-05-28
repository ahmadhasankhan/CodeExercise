require 'rails_helper'

RSpec.describe "Rovers", type: :request do
  describe "GET /rovers" do
    it "works! (now write some real specs)" do
      get rovers_path
      expect(response).to have_http_status(200)
    end
  end
end
