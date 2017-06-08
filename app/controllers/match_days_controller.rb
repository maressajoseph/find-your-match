class MatchDaysController < ApplicationController
  def index
    grouping = Group.first
    #dat = Date.parse params[:view_date]
    puts "*"*50
    #puts dat
    puts "*"*50

    if params[:view_date].nil?
        @view_date = Date.today
    else
        @view_date = Date.parse params[:view_date]
    end

    @match_days = get_weeks_match_days(@view_date, grouping)
    backward_date = @view_date - 7.days
    forward_date = @view_date + 7.days

    respond_to do |format|
      format.html
      format.json { render json: {match_days: @match_days, backward: backward_date, forward: forward_date } }
    end
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

  def get_weeks_match_days(view_date, grouping)
    view_week_days = (view_date.at_beginning_of_week..view_date.at_end_of_week)
    matchdays = MatchDay.where(day: view_week_days)
    week_matches = []
    view_week_days.each do |day|
      days_matchday = matchdays.find_by(day: day)
      if days_matchday.nil?
        week_matches << MatchDay.new(day: day, group: grouping)
      else
        week_matches << days_matchday
      end
    end
    return (week_matches)
  end

  private
  def match_day_params
    params.permit(:day, :group)
  end
end
