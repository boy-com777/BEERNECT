require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    context 'ユーザー作成' do
      subject(:user) { create(:user) }
      it 'uid, name, emailが設定済みだと成功' do
        user = build(:user)
        expect(user).to be_valid
      end

      it 'uid, name, emailが未設定だと失敗' do
        user = build(:user)
        user.uid = ''
        user.name = ''
        user.email = ''
        expect(user).to_not be_valid
      end

      context 'Userモデル更新' do
        it 'profileの文字数が200以下だと成功' do
          user = build(:user)
          user.profile = '200以下'
          expect(user).to be_valid
        end
        it 'profileの文字数が200以上だと失敗' do
          user = build(:user)
          profile = '200以上' * 200
          user.profile = profile
          expect(user).to_not be_valid
        end
      end
    end
  end
end
