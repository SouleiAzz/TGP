class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
    @user = User.find(params['id'])
  end
  
  def create
    @user = User.new(first_name: params[:firstName], last_name: params[:lastName], email: params[:email], password: params[:password], password_confirmation: params[:passwordConfirmation], age: params[:age], description: params[:description], city: City.find(params[:city]))
    if @user.save
      log_in(@user)
      redirect_to root_path
    else 
      @cities = City.all
      @error = "sign up"
      render :new
    end
  end

  def new
    @cities = City.all
  end
end
