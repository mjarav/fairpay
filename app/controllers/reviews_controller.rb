class ReviewsController < ApplicationController
   # should the destroy method be in the show controller?
  before_action :set_review, only: [:destroy]

  def new
    @service = Service.find(params[:service_id])
    @review = Review.new
  end

  def create
    @service = Service.find(params[:service_id])
    @review = Review.new(review_params)
    @review.service = @service
    @review.user = current_user
    if @review.save
      redirect_to service_path(@service)
    else
      render "new"
    end
  end

  def destroy
    @review.destroy if @review.user == current_user

    redirect_to service_path(@review.service)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
