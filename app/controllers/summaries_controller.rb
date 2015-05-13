class SummariesController < ApplicationController
    
  def show
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts
    @summary = Summary.find(params[:id])
  end
    
  def create
    
  end
end
