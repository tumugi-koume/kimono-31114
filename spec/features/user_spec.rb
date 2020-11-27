require 'rails_helper'

feature 'ユーザー新規登録', type: :feature do
  before do
    @user = FactoryBot.build(:user)
  end
  
  scenario '正しい情報を入力すればユーザー新規登録ができトップページに移動する', js: true do
    # トップページに移動する
    visit root_path
    # メニュー画像をクリックし、表示されたメニューリストに新規登録画面へ遷移するボタンがあることを確認する
    find('.menu-logo').click
    expect(page).to have_content('新規登録')
    # 新規登録画面に移動する
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
    # メニュー画像をクリックし、表示されたメニューリストにログアウトボタンが表示されることを確認する
    find('.menu-logo').click
    expect(page).to have_content('ログアウト')
    # 表示されたメニューリストに新規登録画面、ログイン画面に遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
  end

  scenario '誤った情報ではユーザー新規登録ができずに新規登録ページに戻ってくる', js: true do
    # トップページへ移動する
    visit root_path
    # メニュー画像をクリックし、表示されたメニューリストに新規登録画面へ遷移するボタンがあることを確認する
    find('.menu-logo').click
    expect(page).to have_content('新規登録')
    # 新規登録画面に移動する
    visit new_user_registration_path
    # ユーザー情報を入力する
    fill_in 'ニックネーム', with: ""
    fill_in 'Eメール', with: ""
    fill_in 'パスワード', with: ""
    fill_in 'パスワード（確認用）', with: ""
    # 登録ボタンを押してもユーザーモデルのカウントが上がらないことを確認する。
    expect{
      find('input[name="commit"]').click
    }.to change {User.count}.by(0)
    # 新規登録ページに戻されることを確認する
    expect(current_path).to eq "/users"
  end
end

feature 'ユーザーログイン', type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  scenario '保存されているユーザーの情報と合致すればログインができる', js: true do
    # トップページへ移動する
    visit root_path
    # メニュー画像をクリックし、表示されたメニューリストにログイン画面へ遷移するボタンがあることを確認する
    find('.menu-logo').click
    expect(page).to have_content('ログイン')
    # ログイン画面に移動する
    visit new_user_session_path
    # 正しいユーザー情報を入力する
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    # ログインボタンを押す
    find('input[name="commit"]').click
    # トップページに遷移することを確認する
    expect(current_path).to eq root_path
    # メニュー画像をクリックし、表示されたメニューリストにログアウトボタンが表示されることを確認する
    find('.menu-logo').click
    expect(page).to have_content('ログアウト')
    # 表示されたメニューリストに新規登録画面、ログイン画面に遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
  end

  scenario '保存されているユーザーの情報と合致しないとログインができない', js: true do
    # トップページへ移動する
    visit root_path
    # メニュー画像をクリックし、表示されたメニューリストにログイン画面へ遷移するボタンがあることを確認する
    find('.menu-logo').click
    expect(page).to have_content('ログイン')
    # ログイン画面に移動する
    visit new_user_session_path
    # 誤ったユーザー情報を入力する
    fill_in 'Eメール', with: ""
    fill_in 'パスワード', with: ""
    # ログインボタンを押す
    find('.menu-logo').click
    # ログインページに戻れることを確認する
    expect(current_path).to eq new_user_session_path
  end

end