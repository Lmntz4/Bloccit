class SummariesController < ApplicationController
    
  def show
    @post = Post.find params[:post_id]
    @summary = Summary.find params[:id]
    authorize @summary
  end
    
  def create
    @post = Post.find params[:post_id]
    @summary = Summary.new(summary_params)
    authorize @summary

    if @summary.save
      redirect_to @summary
    else
      redirect_to :back
      flash[:error] = "Something went wrong summerizing"
    end
  end

  private
  
  def summary_params
    params.require(:summary).permit(:text)
  end
end
