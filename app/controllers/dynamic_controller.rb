class DynamicController < ApplicationController
  def index
    @current_user = current_user
    session[:return_to] = request.fullpath
    @gossips = Gossip.order(:id)
  end
  def welcome
    @current_user = current_user
    session[:return_to] = request.fullpath
    @name = params['name']
    @gossips = Gossip.order(:id)
  end
end
