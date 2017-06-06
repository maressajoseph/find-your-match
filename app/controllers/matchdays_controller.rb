class MatchdaysController < ApplicationController
 def index

 end

 def new
   @matchday = MatchDay.new
 end

 def create
   @matchday = Matchday.new(match_day_params.merge(day: params[:day]))
   if @matchday.save
     redirect_to 'index'
   end
 end

 private
   def match_day_params
     params.require[:match_day].permit(:day, :available_combination)
   end
end
