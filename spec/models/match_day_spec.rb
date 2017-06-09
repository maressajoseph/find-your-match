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

    it "4 users should make 2 matches" do
      expect(match_day1.matches.length).to equal(2)
    end

    let!(:user5) { create :user }
    let!(:user6) { create :user, admin: true }
    let!(:user7) { create :user, dummy: true }

    let!(:match_day2) { create :match_day, group: group1, day: Date.today + 1}

    it "5 users should include dummy user to make 3 matches" do
      expect(match_day2.matches.length).to equal(3)
    end
  end

  describe "the algorithm" do
    DatabaseCleaner.clean

    let!(:user1) { create :user }
    let!(:user2) { create :user }
    let!(:user3) { create :user }
    let!(:user4) { create :user }

    let!(:group1) { create :group }

    let!(:match_day1) { create :match_day, group: group1, day: Date.today }
    let!(:match_day2) { create :match_day, group: group1, day: Date.today + 1}
    let!(:match_day3) { create :match_day, group: group1, day: Date.today + 2}
    let!(:match_day4) { create :match_day, group: group1, day: Date.today + 3}
    let!(:match_day5) { create :match_day, group: group1, day: Date.today + 4}



    it "expects the matches to be the same every fourth day for 4 students" do

    expect(match_day1.matches.map{ |m| m.student1.first_name}).not_to eq(match_day2.matches.map{ |m| m.student1.first_name})
    expect(match_day1.matches.map{ |m| m.student1.first_name}).not_to eq(match_day3.matches.map{ |m| m.student1.first_name})
    expect(match_day1.matches.map{ |m| m.student1.first_name}).to eq(match_day4.matches.map{ |m| m.student1.first_name})
  end
  end

end
