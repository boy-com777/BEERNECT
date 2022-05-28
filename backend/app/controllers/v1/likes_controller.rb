module V1
  class LikesController < ApplicationController
    before_action :set_user, only: [:destroy]

    def create
      like = Like.create!(like_params)
      if like.save
        render json: @current_user
      else
        render json: { status: 400 }
      end
    end

    def destroy
      like = @current_user.unlike(@post)
      if like.destroy
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
      params.require(:like).permit(:user_id, :post_id)
    end
  end
end
