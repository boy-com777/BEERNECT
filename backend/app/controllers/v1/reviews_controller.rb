module V1
  class ReviewsController < ApplicationController
    def index
      review = Review.all
      render json: review
    end

    def create
      review = Review.create!(review_params)
      if review.save
        render json: review
      else
        render json: review.errors
      end
    end

    def destroy
      review = Review.find(params[:id])
      render json: review if review.destroy
    end

    praivate

    def review_params
      params.require(:review).permit(:title, :content, :review_score, :user_id, :beer_id)
    end
  end
end
