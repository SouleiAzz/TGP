class CitiesController < ApplicationController
  def show
    @current_user = current_user
    @city = City.find(params['id'])
    @gossips = @city.gossips.order(:id)
  end
end
