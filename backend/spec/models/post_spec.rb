require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションチェック' do
    subject { post.valid? }

    context 'データが条件を満たすとき' do
      let!(:post) { build(:post) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end

    context 'title が空のとき' do
      let!(:post) { build(:post, title: '') }
      it 'title 空エラー' do
        expect(subject).to eq false
        expect(post.errors.messages[:title]).to include 'を入力してください'
      end
    end

    context 'content が空のとき' do
      let!(:post) { build(:post, content: '') }
      it 'content 空エラー' do
        expect(subject).to eq false
        expect(post.errors.messages[:content]).to include 'を入力してください'
      end
    end
  end
end
