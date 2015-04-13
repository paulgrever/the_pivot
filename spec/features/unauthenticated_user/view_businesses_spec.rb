require "rails_helper"

RSpec.describe "Unauthenticated user", type: :feature do
  context "when visiting a business' page that does not exist" do
    it "should return a 404 error page" do
      visit "/business-does-not-exist"
      expect(page.status_code).to eq(404)
    end
  end
end
