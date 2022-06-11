require 'rails_helper'

RSpec.describe Memory, type: :model do
  describe 'バリデーションチェック' do
    subject { memory.valid? }

    context 'データが条件を満たすとき' do
      let!(:memory) { build(:memory) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end

    context 'beer_name が空のとき' do
      let!(:memory) { build(:memory, beer_name: '') }
      it 'beer_name 空エラー' do
        expect(subject).to eq false
        expect(memory.errors.messages[:beer_name]).to include 'を入力してください'
      end
    end
  end
end
