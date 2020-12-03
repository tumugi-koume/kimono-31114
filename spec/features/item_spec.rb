require 'rails_helper'

feature '小物登録', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context '小物の登録ができるとき' do
    scenario 'ログインしたユーザーは小物の登録ができる', js: true do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし小物一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('小物')
      # 小物一覧画面に遷移する
      visit items_path
      # 小物登録画面へ遷移するボタンがあることを確認する
      expect(page).to have_content('小物をしまう')
      # 小物登録画面に移動する
      visit new_item_path
      # フォームに情報を入力する
      attach_file "goods-image", "public/images/test_image.png"
      select '長襦袢', from: 'item_item_name_id'
      select 'カジュアル', from: 'item_tpo_id'
      select '絹', from: 'item_material_id'
      fill_in 'season-text', with: '秋〜春'
      fill_in 'color_pattern_text', with: '地色は藤色。桜の花柄。'
      select '2020', from: 'item_wore_date_1i'
      select '4', from: 'item_wore_date_2i'
      select '5', from: 'item_wore_date_3i'
      select '2020', from: 'item_cleaned_date_1i'
      select '7', from: 'item_cleaned_date_2i'
      select '20', from: 'item_cleaned_date_3i'
      fill_in 'memo_text', with: '娘の入園式で着用した。'
      # 登録ボタンを押すとItemモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Item.count}.by(1)
      # 小物一覧ページに遷移することを確認する
      expect(current_path).to eq items_path
      # 小物一覧ページに先ほど登録した小物が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.png']")
      # 小物一覧ページに先ほど登録した小物が存在することを確認する（種類名）
      expect(page).to have_content('長襦袢')
    end
  end

  context '小物の登録ができないとき' do
    scenario 'ログインしていないと小物一覧画面に遷移できない' do
      # 小物一覧画面へ遷移するボタンがないことを確認する
      visit root_path
      find('.menu-logo').click
      expect('.menu-lists').to have_no_content("小物")
    end
  end
end

feature '小物詳細', type: :feature do
  before do
    @item = FactoryBot.create(:item)
  end

  context '登録した小物の詳細を見ることができる' do
    scenario 'ログインしたユーザーは登録した小物の詳細ページに遷移することができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @item.user.email
      fill_in 'パスワード', with: @item.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし小物一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('小物')
      # 小物一覧画面に遷移する
      visit items_path
      # 小物一覧ページに表示されたitemの画像をクリックする
      first(".to-show-img").click
      # itemの詳細画面に遷移することを確認する
      expect(current_path).to eq item_path(@item)
      # 詳細ページにitemの情報が表示されている
      expect(page).to have_selector("img[src$='test_image.png']")
      expect(page).to have_content("#{@item.item_name.name}")
      expect(page).to have_content("#{@item.tpo.name}")
      expect(page).to have_content("#{@item.material.name}")
      expect(page).to have_content("#{@item.color_pattern}")
      expect(page).to have_content("#{@item.season}")
      expect(page).to have_content("#{@item.memo}")
      expect(page).to have_content("#{@item.wore_date}")
      expect(page).to have_content("#{@item.cleaned_date}")
    end
  end

  context '小物の詳細を見ることができない' do
    scenario 'ログインしていないと小物の詳細ページに遷移できない' do
      # 小物一覧画面へ遷移するボタンがないことを確認する
      visit root_path
      find('.menu-logo').click
      expect('.menu-lists').to have_no_content("小物")
    end
  end
end

feature '小物編集', type: :feature do
  before do
    @item = FactoryBot.create(:item)
  end

  context '登録した小物の情報を編集できる' do
    scenario 'ログインしたユーザーは自分が登録した小物の情報の編集ができる' do
      # itemを登録したユーザーでログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @item.user.email
      fill_in 'パスワード', with: @item.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし小物一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('小物')
      # 小物一覧画面に遷移する
      visit items_path
      # 小物一覧ページに表示されたitemの画像をクリックする
      first(".to-show-img").click
      # itemの詳細画面に遷移することを確認する
      expect(current_path).to eq item_path(@item)
      # 詳細画面に「編集」ボタンがあることを確認する
      expect(page).to have_content('編集')
      # itemの編集画面に遷移する
      visit edit_item_path(@item)
      # 登録内容を編集する
      select '帯揚', from: 'item_item_name_id'
      select 'フォーマル', from: 'item_tpo_id'
      select 'ポリエステル', from: 'item_material_id'
      fill_in 'season-text', with: '秋〜春'
      fill_in 'color_pattern_text', with: '地色は藤色。桜の花柄。'
      # 編集ボタンを押してもitemモデルのカウントが変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(0)
      # itemの詳細画面に遷移していることを確認する
      expect(current_path).to eq item_path(@item)
      # 詳細画面に先ほど変更した内容の登録が存在することを確認する
      expect(page).to have_content("帯揚")
      expect(page).to have_content("フォーマル")
      expect(page).to have_content("ポリエステル")
      expect(page).to have_content("秋〜春")
      expect(page).to have_content("地色は藤色。桜の花柄。")
    end
  end
end

feature '小物削除', type: :feature do
  before do
    @item = FactoryBot.create(:item)
  end

  context '小物の情報が削除できるとき' do
    scenario 'ログインしたユーザーは自分の小物の情報を削除することができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @item.user.email
      fill_in 'パスワード', with: @item.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ヘッダーのメニューアイコンをクリックし帯一覧画面へのリンクがあることを確認する
      find('.menu-logo').click
      expect(page).to have_content('小物')
      # 小物一覧画面に遷移する
      visit items_path
      # 小物一覧ページに表示されたitemの画像をクリックする
      first(".to-show-img").click
      # itemの詳細画面に遷移することを確認する
      expect(current_path).to eq item_path(@item)
      # 削除ボタンがあることを確認する
      expect(page).to have_content('削除')
      # 削除するとレコードの数が１減ることを確認する
      expect{
        click_on '削除'
      }.to change { Item.count }.by(-1)
      # 小物一覧ページに遷移していることを確認する
      expect(current_path).to eq items_path
      # 一覧ページにitemの内容がないことを確認する（画像）
      expect(page).to have_no_selector("img[src$='test_image.png']")
      # 一覧ページにitemの内容がないことを確認する（種類名）
      expect(page).to have_no_content("#{@item.item_name.name}")
    end
  end
end