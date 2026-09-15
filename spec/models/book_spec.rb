require "rails_helper"

RSpec.describe Book, type: :model do
  # These books come from db/seeds.rb, loaded with: RAILS_ENV=test rails db:seed
  it "has the seeded books in the test database" do
    expect(Book.count).to be >= 5
    expect(Book.find_by(title: "Origami for cats")).to be_present
  end
end
