class LikesController < ApplicationController
  def create
    like = params[:comment_id].nil? ? Like.new(content: Gossip.find(params[:gossip_id]), user: current_user) : Like.new(content: Comment.find(params[:comment_id]), user: current_user) 
    to_check = params[:comment_id].nil? ? Gossip.find(params[:gossip_id]).users.include?(current_user) : Comment.find(params[:comment_id]).users.include?(current_user) 
    unless to_check
      @error = "like" unless like.save  
    end
    redirect_back(fallback_location: gossips_path)
  end

  def destroy
    like = params[:comment_id].nil? ? Like.find_by(content: Gossip.find(params[:gossip_id]), user: current_user) : Like.find_by(content: Comment.find(params[:comment_id]), user: current_user) 
    like.destroy unless like.nil?
    redirect_back(fallback_location: gossips_path)
  end
end
