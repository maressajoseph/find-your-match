class AvailableCombinationsController < ApplicationController

  def create
    @available_combination = AvailableCombination.new(available_combination_params)
    @available_combination.save
  end

  private
  def available_combination_params
    params.require(:available_combination).require(:combis)
  end
end
