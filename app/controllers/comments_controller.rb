class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.new(user: current_user, gossip: Gossip.find(params['gossip_id']), content: params[:content])
    if @comment.save
      session[:from] = "commente"
      redirect_to gossip_path(@id = params['gossip_id'])
    else
      @error = true
      render 'gossip/show'
    end
  end

  def edit
    @current_user = current_user
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    redirect_to gossip_path(@id = params[:gossip_id]) unless current_user == @comment.user
    if @comment.update(content: params[:content]) 
      session[:from] = "change"
      redirect_to gossip_path(@id = params['gossip_id'])
    else 
      @error = true
      render 'comment/edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user == @comment.gossip.user
      @comment.destroy
      session[:from] = " delete"
    end
    redirect_to gossip_path(@id = params['gossip_id'])
  end
end
