Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    # user関連
    patch 'users/:id/avatar_update', to: 'users#avatar_update'
    resources :users, only: %i[index show create update destroy]

    # beer関連
    # beer_style
    get '/beers/pilsner'
    get '/beers/paleale'
    get '/beers/ipa'
    get '/beers/hazyipa'
    get '/beers/sessionipa'
    get '/beers/porter'
    get '/beers/stout'
    get '/beers/weizen'
    get '/beers/belgianwhite'
    get '/beers/amberale'
    get '/beers/goldenale'
    get '/beers/saison'
    get '/beers/sourbeer'

    # beer_local
    get 'beers/hokkaido'
    get 'beers/aomori'
    get 'beers/iwate'
    get 'beers/miyagi'
    get 'beers/akita'
    get 'beers/yamagata'
    get 'beers/fukushima'
    get 'beers/ibaraki'
    get 'beers/tochigi'
    get 'beers/gunma'
    get 'beers/saitama'
    get 'beers/chiba'
    get 'beers/tokyo'
    get 'beers/kanagawa'
    get 'beers/niigata'
    get 'beers/toyama'
    get 'beers/ishikawa'
    get 'beers/fukui'
    get 'beers/yamanashi'
    get 'beers/nagano'
    get 'beers/gifu'
    get 'beers/shizuoka'
    get 'beers/aichi'
    get 'beers/mie'
    get 'beers/shiga'
    get 'beers/kyoto'
    get 'beers/osaka'
    get 'beers/hyogo'
    get 'beers/nara'
    get 'beers/wakayama'
    get 'beers/tottori'
    get 'beers/shimane'
    get 'beers/okayama'
    get 'beers/hiroshima'
    get 'beers/yamaguchi'
    get 'beers/tokushima'
    get 'beers/kagawa'
    get 'beers/ehime'
    get 'beers/kochi'
    get 'beers/fukuoka'
    get 'beers/saga'
    get 'beers/nagasaki'
    get 'beers/kumamoto'
    get 'beers/oita'
    get 'beers/miyazaki'
    get 'beers/kagoshima'
    get 'beers/okinawa'
    resources :beers, only: %i[index show]

    # posts 関連
    resources :posts, only: %i[index show create update destroy]

    # reviews 関連
    resources :posts, only: %i[index create destroy]

    # relationships 関連
    resources :relationships, only: %i[create destroy]

    # memories 関連
    resources :memories, only: %i[index create]

    # likes 関連
    resources :likes, only: %i[create destroy]
  end
end
