class ReviewsController < ApplicationController
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

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
