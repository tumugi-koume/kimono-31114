require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができトップページに移動する' do
      # 新規登録ページに移動する
      visit  new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      # 登録ボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
    end 
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページに戻ってくる' do
      # トップページへ移動する
      # メニューロゴにカーソルを合わせると新規登録ページへのリンクが表示されることを確認する
      # トップページに新規登録ページへ遷移するボタンがあることを確認する
      # 新規登録ページに移動する
      # ユーザー情報を入力する
      # 登録ボタンを押してもユーザーモデルのカウントが上がらないことを確認する。
      # 新規登録ページに戻されることを確認する
    end
  end

end
