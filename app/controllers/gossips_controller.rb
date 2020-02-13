class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    session[:return_to] = request.fullpath
    @current_user = current_user
    @action = session[:from]
    session[:from] = nil
    @gossips = Gossip.order(:id)
  end

  def show
    session[:return_to] = request.fullpath
    @current_user = current_user
    @gossip = Gossip.find(params['id'])
    @action = session[:from]
    session[:from] = nil
  end

  def create
    @gossip = Gossip.new(user: current_user, title: params[:title], content: params[:content])
    if @gossip.save
      JoinGossipTag.create(gossip: @gossip, tag_id: params[:tags]) unless params[:tags] == "none"
      session[:from] = "create"
      redirect_to gossips_path
    else
      @tags = Tag.all
      @error = true
      render :new
    end
  end

  def new
    session[:return_to] = request.fullpath
    @tags = Tag.all
    @error = false
  end

  def update
    @gossip = Gossip.find(params[:id])
    redirect_to gossip_path(params[:id]) unless current_user == @gossip.user
    if @gossip.update(title: params[:title], content: params[:content])
      JoinGossipTag.create(gossip: @gossip, tag_id: params[:tags]) unless params[:tags] == "none"
      JoinGossipTag.find_by(gossip: @gossip, tag_id: params[:delete_tags]).destroy unless params[:delete_tags] == "none"
      session[:from] = "update"
      redirect_to @gossip
    else
      @error = true
      render :edit
    end
  end

  def edit
    @tags = Tag.all
    @gossip = Gossip.find(params['id'])
    redirect_to gossip_path(params[:id]) unless current_user == @gossip.user
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    redirect_to gossip_path(params[:id]) unless current_user == @gossip.user
    @gossip.destroy
    session[:from] = "delete"
    redirect_to gossips_path
  end
end
