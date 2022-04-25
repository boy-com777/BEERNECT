Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    # user関連
    resources :users, only: %i[index create update]

    # beer関連
    # beer_style
    get '/beers/pilsner'
    resources :beers, only: %i[index show]
  end
end
