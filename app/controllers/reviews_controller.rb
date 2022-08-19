class ReviewsController < ApplicationController
  before_action :set_list, only: %i[new create destroy]

  def index
    @reviews = Review.where(list_id: @list_id)
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list), notice: 'Review was successfully created.'
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to review_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
