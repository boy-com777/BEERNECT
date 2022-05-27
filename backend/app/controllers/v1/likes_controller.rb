module V1
  class LikesController < ApplicationController
    before_action :set_user, only: [:destroy]

    def create
      likepost = PostLike.create!(like_params)
      if likepost.save
        render json: @current_user
      else
        render json: { status: 400 }
      end
    end

    def destroy
      likepost = @current_user.unlike(@post)
      if likepost.destroy
        render json: @current_user
      else
        render json: { status: 400 }
      end
    end

    private

    def set_user
      @current_user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
    end

    def like_params
      params.permit(:user_id, :post_id)
    end
  end
end
