module V1
  class PostsController < ApplicationController
    def index
      post = Post.all
      render json: post
    end

    def show
      post = Post.find(params[:id])
      render json: post
    end

    def create
      post = Post.create!(post_params)
      if post.save
        render json: post
      else
        render json: post.errors
      end
    end

    def update
      post = Post.update!(post_params)
      if post.save
        render json: post
      else
        render json: post.errors
      end
    end

    def destroy
      post = Post.find(params[:id])
      render json: post if post.destroy
    end

    private

    def post_params
      params.require(:post).permit(:title, :contenr, :recomend_score, :user_id)
    end
  end
end
