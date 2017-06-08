class MatchdaysController < ApplicationController
 def index
   @view_date = Date.today
   @view_week_days = (@view_date.at_beginning_of_week..@view_date.at_end_of_week)
 end

 def new
   @matchday = MatchDay.new
 end

 def create
   @matchday = MatchDay.new(match_day_params.merge(day: params[:day], group: Group.find(params[:group])))
   if @matchday.save
     redirect_to 'index'
   end
 end

 private
   def match_day_params
     params.permit(:day, :group)
   end
end
