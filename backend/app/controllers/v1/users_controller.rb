module V1
  class UsersController < ApplicationController
    def index
      users = if params[:uid]
                User.includes(
                  :following,
                  :followers,
                  :posts,
                  { liked_posts: [:liked_users] }
                ).find_by(uid: params[:uid])
              else
                User.all
              end
      render json: users.as_json(
        include: [
          :following,
          :followers,
          :posts,
          { liked_posts: { include: { liked_users: { only: [:id] } } } }
        ]
      )
    end

    # def show
    #   user = User.find(params[:id])
    #   render json: user
    # end

    def show
      user = User.includes(
        :following,
        :followers,
        { liked_posts: [:liked_users] }
      ).find(params[:id])
      render json: user.as_json(
        include: [
          { liked_posts: { include:
            {
              liked_users: { only: [:id] }
            } } },
          :following,
          :followers
        ]
      )
    end

    def create
      user = User.create!(user_params)
      if user.save
        render json: user
      else
        render json: user.errors
      end
    end

    def update
      user = User.find(params[:id])
      user.update!(user_params)
      if user.save
        render json: user
      else
        render json: user.errors
      end
    end

    def avatar_update
      user = User.find(params[:id])
      user.update!(avatar: params[:avatar])
      if user.save
        render json: user
      else
        render json: user.errors
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :uid, :profile, :favorite_beer, :avatar)
    end
  end
end
