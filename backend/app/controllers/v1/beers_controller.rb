module V1
  class BeersController < ApplicationController
    def index
      beer = Beer.all
      render json: beer
    end

    def show
      beer = Beer.find(params[:id])
      render json: beer
    end

    def pilsner
      beer = Beer.where(beer_style: 'ピルスナー')
      render json: beer
    end

    def paleale
      beer = Beer.where(beer_style: 'ペールエール')
      render json: beer
    end

    def ipa
      beer = Beer.where(beer_style: 'IPA')
      render json: beer
    end

    def hazyipa
      beer = Beer.where(beer_style: 'ヘイジーIPA')
      render json: beer
    end

    def sessionipa
      beer = Beer.where(beer_style: 'セッションIPA')
      render json: beer
    end

    def porter
      beer = Beer.where(beer_style: 'ポーター')
      render json: beer
    end

    def stout
      beer = Beer.where(beer_style: 'スタウト')
      render json: beer
    end

    def weizen
      beer = Beer.where(beer_style: 'ヴァイツェン')
      render json: beer
    end

    def belgianwhite
      beer = Beer.where(beer_style: 'ベルジャンホワイト')
      render json: beer
    end

    def amberale
      beer = Beer.where(beer_style: 'アンバーエール')
      render json: beer
    end

    def goldenale
      beer = Beer.where(beer_style: 'ゴールデンエール')
      render json: beer
    end

    def saison
      beer = Beer.where(beer_style: 'セゾン/ファームハウスエール')
      render json: beer
    end

    def sourbeer
      beer = Beer.where(beer_style: 'サワービール')
      render json: beer
    end

    def hokkaido
      beer = Beer.where(local_name: '北海道')
      render json: beer
    end

    def aomori
      beer = Beer.where(local_name: '青森')
      render json: beer
    end

    def iwate
      beer = Beer.where(local_name: '岩手')
      render json: beer
    end

    def miyagi
      beer = Beer.where(local_name: '宮城')
      render json: beer
    end

    def akita
      beer = Beer.where(local_name: '秋田')
      render json: beer
    end

    def yamagata
      beer = Beer.where(local_name: '山形')
      render json: beer
    end

    def fukushima
      beer = Beer.where(local_name: '福島')
      render json: beer
    end

    def ibaraki
      beer = Beer.where(local_name: '茨城')
      render json: beer
    end

    def tochigi
      beer = Beer.where(local_name: '栃木')
      render json: beer
    end

    def gunma
      beer = Beer.where(local_name: '群馬')
      render json: beer
    end

    def saitama
      beer = Beer.where(local_name: '埼玉')
      render json: beer
    end

    def chiba
      beer = Beer.where(local_name: '千葉')
      render json: beer
    end

    def tokyo
      beer = Beer.where(local_name: '東京')
      render json: beer
    end

    def kanagawa
      beer = Beer.where(local_name: '神奈川')
      render json: beer
    end

    def niigata
      beer = Beer.where(local_name: '新潟')
      render json: beer
    end

    def toyama
      beer = Beer.where(local_name: '富山')
      render json: beer
    end

    def ishikawa
      beer = Beer.where(local_name: '石川')
      render json: beer
    end

    def fukui
      beer = Beer.where(local_name: '福井')
      render json: beer
    end

    def yamanashi
      beer = Beer.where(local_name: '山梨')
      render json: beer
    end

    def nagano
      beer = Beer.where(local_name: '長野')
      render json: beer
    end

    def gifu
      beer = Beer.where(local_name: '岐阜')
      render json: beer
    end

    def shizuoka
      beer = Beer.where(local_name: '静岡')
      render json: beer
    end

    def aichi
      beer = Beer.where(local_name: '愛知')
      render json: beer
    end

    def mie
      beer = Beer.where(local_name: '三重')
      render json: beer
    end

    def shiga
      beer = Beer.where(local_name: '滋賀')
      render json: beer
    end

    def kyoto
      beer = Beer.where(local_name: '京都')
      render json: beer
    end

    def osaka
      beer = Beer.where(local_name: '大阪')
      render json: beer
    end

    def hyogo
      beer = Beer.where(local_name: '兵庫')
      render json: beer
    end

    def nara
      beer = Beer.where(local_name: '奈良')
      render json: beer
    end

    def wakayama
      beer = Beer.where(local_name: '和歌山')
      render json: beer
    end

    def tottori
      beer = Beer.where(local_name: '鳥取')
      render json: beer
    end

    def shimane
      beer = Beer.where(local_name: '島根')
      render json: beer
    end

    def okayama
      beer = Beer.where(local_name: '岡山')
      render json: beer
    end

    def hiroshima
      beer = Beer.where(local_name: '広島')
      render json: beer
    end

    def yamaguchi
      beer = Beer.where(local_name: '山口')
      render json: beer
    end

    def tokushima
      beer = Beer.where(local_name: '徳島')
      render json: beer
    end

    def kagawa
      beer = Beer.where(local_name: '香川')
      render json: beer
    end

    def ehime
      beer = Beer.where(local_name: '愛媛')
      render json: beer
    end

    def kochi
      beer = Beer.where(local_name: '高知')
      render json: beer
    end

    def fukuoka
      beer = Beer.where(local_name: '福岡')
      render json: beer
    end

    def saga
      beer = Beer.where(local_name: '佐賀')
      render json: beer
    end

    def nagasaki
      beer = Beer.where(local_name: '長崎')
      render json: beer
    end

    def kumamoto
      beer = Beer.where(local_name: '熊本')
      render json: beer
    end

    def oita
      beer = Beer.where(local_name: '大分')
      render json: beer
    end

    def miyazaki
      beer = Beer.where(local_name: '宮崎')
      render json: beer
    end

    def kagoshima
      beer = Beer.where(local_name: '鹿児島')
      render json: beer
    end

    def okinawa
      beer = Beer.where(local_name: '沖縄')
      render json: beer
    end

    private

    def beer_params
      params.permit(:beer_name, :beer_style, :local_name, :local_number, :brewery_name, :brewery_url)
    end
  end
end
