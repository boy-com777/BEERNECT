module V1
  class PostsController < ApplicationController
    def index
      posts = Post.all.includes(:liked_users, :user).order(created_at: 'DESC')
      render json: posts.as_json(include: %i[liked_users user])
    end

    # def index
    #   posts = Post.all.order(created_at: 'DESC')
    #   render json: posts
    # end

    # def show
    #   post = Post.find(params[:id])
    #   render json: post
    # end

    def show
      post = Post.includes(:user, :liked_users).find(params[:id])
      render json: post.as_json(
        include: %i[
          user
          liked_users
        ]
      )
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
      params.require(:post).permit(:title, :content, :recomend_score, :user_id, :image)
    end
  end
end
