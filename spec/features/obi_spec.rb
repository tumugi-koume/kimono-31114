require 'rails_helper'

feature '帯登録', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @obi = FactoryBot.build(:obi)
  end

  context '帯の登録ができるとき' do
    scenario 'ログインしたユーザーは帯の登録ができる', js: true do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし帯一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('帯')
      # 帯一覧画面に遷移する
      visit obis_path
      # 着物登録画面へ遷移するボタンがあることを確認する
      expect(page).to have_content('帯をしまう')
      # 着物登録画面に移動する
      visit new_obi_path
      # フォームに情報を入力する
      attach_file "goods-image", "public/images/test_image.png"
      select '名古屋帯', from: 'obi_obi_name_id'
      select 'カジュアル', from: 'obi_tpo_id'
      select '絹', from: 'obi_material_id'
      fill_in 'season-text', with: '秋〜春'
      fill_in 'color_pattern_text', with: '地色は藤色。桜の花柄。'
      select '2020', from: 'obi_wore_date_1i'
      select '4', from: 'obi_wore_date_2i'
      select '5', from: 'obi_wore_date_3i'
      select '2020', from: 'obi_cleaned_date_1i'
      select '7', from: 'obi_cleaned_date_2i'
      select '20', from: 'obi_cleaned_date_3i'
      fill_in 'memo_text', with: '娘の入園式で着用した。'
      # 登録ボタンを押すとObiモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Obi.count}.by(1)
      # 帯一覧ページに遷移することを確認する
      expect(current_path).to eq obis_path
      # 帯一覧ページに先ほど登録した帯が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.png']")
      # 帯一覧ページに先ほど登録した帯が存在することを確認する（種類名）
      expect(page).to have_content('名古屋帯')
    end
  end

  context '帯の登録ができないとき' do
    scenario 'ログインしていないと帯一覧画面に遷移できない' do
      # 帯一覧画面へ遷移するボタンがないことを確認する
      visit root_path
      find('.menu-logo').click
      expect('.menu-lists').to have_no_content("帯")
    end
  end
end

feature '帯詳細', type: :feature do
  before do
    @obi = FactoryBot.create(:obi)
  end

  context '登録した帯の詳細を見ることができる' do
    scenario 'ログインしたユーザーは登録した帯の詳細ページに遷移することができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @obi.user.email
      fill_in 'パスワード', with: @obi.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし帯一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('帯')
      # 帯一覧画面に遷移する
      visit obis_path
      # 帯一覧ページに表示されたobiの画像をクリックする
      first(".to-show-img").click
      # obiの詳細画面に遷移することを確認する
      expect(current_path).to eq obi_path(@obi)
      # 詳細ページにobiの情報が表示されている
      expect(page).to have_selector("img[src$='test_image.png']")
      expect(page).to have_content("#{@obi.obi_name.name}")
      expect(page).to have_content("#{@obi.tpo.name}")
      expect(page).to have_content("#{@obi.material.name}")
      expect(page).to have_content("#{@obi.color_pattern}")
      expect(page).to have_content("#{@obi.season}")
      expect(page).to have_content("#{@obi.memo}")
      expect(page).to have_content("#{@obi.wore_date}")
      expect(page).to have_content("#{@obi.cleaned_date}")
    end
  end

  context '着物の詳細を見ることができない' do
    scenario 'ログインしていないと着物の詳細ページに遷移できない' do
      # 帯一覧画面へ遷移するボタンがないことを確認する
      visit root_path
      find('.menu-logo').click
      expect('.menu-lists').to have_no_content("帯")
    end
  end
end

feature '帯編集', type: :feature do
  before do
    @obi = FactoryBot.create(:obi)
  end

  context '登録した帯の情報を編集できる' do
    scenario 'ログインしたユーザーは自分が登録した帯の情報の編集ができる' do
      # obiを登録したユーザーでログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @obi.user.email
      fill_in 'パスワード', with: @obi.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし帯一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('帯')
      # 帯一覧画面に遷移する
      visit obis_path
      # 帯一覧ページに表示されたobiの画像をクリックする
      first(".to-show-img").click
      # obiの詳細画面に遷移することを確認する
      expect(current_path).to eq obi_path(@obi)
      # 詳細画面に「編集」ボタンがあることを確認する
      expect(page).to have_content('編集')
      # kimono1の編集画面に遷移する
      visit edit_obi_path(@obi)
      # 登録内容を編集する
      select '袋帯', from: 'obi_obi_name_id'
      select 'フォーマル', from: 'obi_tpo_id'
      select 'ポリエステル', from: 'obi_material_id'
      fill_in 'season-text', with: '秋〜春'
      fill_in 'color_pattern_text', with: '地色は藤色。桜の花柄。'
      # 編集ボタンを押してもObiモデルのカウントが変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Obi.count }.by(0)
      # obiの詳細画面に遷移していることを確認する
      expect(current_path).to eq obi_path(@obi)
      # 詳細画面に先ほど変更した内容の登録が存在することを確認する
      expect(page).to have_content("袋帯")
      expect(page).to have_content("フォーマル")
      expect(page).to have_content("ポリエステル")
      expect(page).to have_content("秋〜春")
      expect(page).to have_content("地色は藤色。桜の花柄。")
    end
  end
end

feature '帯削除', type: :feature do
  before do
    @obi = FactoryBot.create(:obi)
  end

  context '帯の情報が削除できるとき' do
    scenario 'ログインしたユーザーは自分の帯の情報を削除することができる' do
      # ログインするvisit new_user_session_path
      visit new_user_session_path
      fill_in 'Eメール', with: @obi.user.email
      fill_in 'パスワード', with: @obi.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし帯一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('帯')
      # 帯一覧画面に遷移する
      visit obis_path
      # 帯一覧ページに表示されたobiの画像をクリックする
      first(".to-show-img").click
      # obiの詳細画面に遷移することを確認する
      expect(current_path).to eq obi_path(@obi)
      # 削除ボタンがあることを確認する
      expect(page).to have_content('削除')
      # 削除するとレコードの数が１減ることを確認する
      expect{
        click_on '削除'
      }.to change { Obi.count }.by(-1)
      # 帯一覧ページに遷移していることを確認する
      expect(current_path).to eq obis_path
      # 一覧ページにobiの内容がないことを確認する（画像）
      expect(page).to have_no_selector("img[src$='test_image.png']")
      # 一覧ページにobiの内容がないことを確認する（種類名）
      expect(page).to have_no_content("#{@obi.obi_name.name}")
    end
  end
end