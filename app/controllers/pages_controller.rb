class PagesController < ApplicationController
  def home
    @match_days = MatchDay.where(user_id: @user)
  end

end
