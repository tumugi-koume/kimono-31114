require 'rails_helper'

feature '着物登録', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @kimono = FactoryBot.build(:kimono)
  end


  context '着物の登録ができるとき' do
    scenario 'ログインしたユーザーは着物の登録ができる', js: true do
      # ログインする
      # 着物登録画面へ遷移するボタンがあることを確認する
      # 着物登録画面に移動する
      # フォームに情報を入力する
      # 登録ボタンを押すとKimonoモデルのカウントが１上がることを確認する
      # 着物一覧ページ（トップページ）に遷移することを確認する
      # 着物一覧ページに先ほど登録した着物が存在することを確認する（画像）
      # 着物一覧ページに先ほど登録した着物が存在することを確認する（種類名）
    end
  end

  context '着物の登録ができないとき' do
    scenario 'ログインしていないと着物登録画面に遷移できない' do
      # 着物登録画面へ遷移するボタンがあることを確認する
      # 着物登録画面に移動する
      # ログイン画面に遷移していることを確認する
    end
  end
end