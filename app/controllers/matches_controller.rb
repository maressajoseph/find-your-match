class MatchesController < ApplicationController

  def create
    @match = Match.new(match_params)
    @match.save
  end


  private
  def match_params
    params.require(:match)
  end
end
