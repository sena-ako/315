class LikesController < ApplicationController
    
    def create
        @topics = Topic.find(params[:topic_id])
        @alreadylike = Like.find_by(ip: request.remote_ip, id: params[:id])
        if @alreadylike
           redirect_back(fallback_location: root_path)
           flash[:notice] = "すでにいいねしています"
        else
           @like = Like.create(id: params[:id], ip: request.remote_ip)
           redirect_back(fallback_location: root_path)
        end
    end

end
