require 'rails_helper'
require 'database_cleaner'


RSpec.describe MatchDay, type: :model do
  DatabaseCleaner.strategy = :truncation

  DatabaseCleaner.clean

  describe "testing matching algorithm" do
    let!(:user1) { create :user }
    let!(:user2) { create :user }
    let!(:user3) { create :user }
    let!(:user4) { create :user }

    let!(:group1) { create :group }

    let!(:match_day1) { create :match_day, group: group1, day: Date.today }

    it "creates a matchday which includes 2 matches" do
      expect(match_day1.matches.length).to equal(2)
    end

    let!(:user5) { create :user }
    let!(:user6) { create :user, admin: true }
    let!(:user7) { create :user, dummy: true }

    let!(:match_day2) { create :match_day, group: group1, day: Date.today + 1}

    it "expects the dummy user to be included so there are 3 matches" do
      expect(match_day2.matches.length).to equal(3)
    end

    it "expects the matches from the first matchday to be different than the matches from the second matchday" do
      expect(match_day1.matches).not_to equal(match_day1.matches)
    end

    let!(:more_matchdays) { create_list :match_day, 4, group: group1  }

    it "expects n=(assignable_users)-1 matchdays to all have different matches" do
      
    end

  end
end
