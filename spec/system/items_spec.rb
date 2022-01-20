require 'rails_helper'

RSpec.describe '商品出品', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      basic_auth root_path
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(page).to eq(root_path)
      # 商品出品ページへのボタンがあることを確認する

      # 出品ページに移動する
      # フォームに情報を入力する
      # 送信するとItemモデルのカウントが1上がることを確認する
      # トップページに遷移する
      # トップページには先ほど投稿した内容の商品が存在することを確認する（画像）
      # トップページには先ほど投稿した内容の商品が存在することを確認する（テキスト）
    end
  end
  context '商品出品ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # ログインページに遷移する
      # 新規投稿ページへのボタンがないことを確認する
    end
  end
end
