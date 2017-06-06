class MatchdaysController < ApplicationController
 def index

 end

 def new
   @matchday = MatchDay.new
 end

 def create
   @matchday = MatchDay.new(match_day_params.merge(day: params[:day], available_combination: AvailableCombination.find(params[:available_combination])))
   if @matchday.save
     redirect_to 'index'
   end
 end

 private
   def match_day_params
     params.permit(:day, :available_combination)
   end
end
