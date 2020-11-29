require 'rails_helper'

feature '着物登録', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @kimono = FactoryBot.build(:kimono)
  end


  context '着物の登録ができるとき' do
    scenario 'ログインしたユーザーは着物の登録ができる', js: true do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 着物登録画面へ遷移するボタンがあることを確認する
      expect(page).to have_content('着物をしまう')
      # 着物登録画面に移動する
      visit new_kimono_path
      # フォームに情報を入力する
      attach_file "goods-image", "public/images/test_image.png"
      select '小紋', from: 'kimono_kimono_name_id'
      select '単衣', from: 'kimono_kimono_genre_id'
      select 'カジュアル', from: 'kimono_tpo_id'
      select '絹', from: 'kimono_material_id'
      fill_in 'season-text', with: '秋〜春'
      fill_in 'color_pattern_text', with: '地色は藤色。桜の花柄。'
      select '2020', from: 'kimono_wore_date_1i'
      select '4', from: 'kimono_wore_date_2i'
      select '5', from: 'kimono_wore_date_3i'
      select '2020', from: 'kimono_cleaned_date_1i'
      select '7', from: 'kimono_cleaned_date_2i'
      select '20', from: 'kimono_cleaned_date_3i'
      fill_in 'memo_text', with: '娘の入園式で着用した。'
      # 登録ボタンを押すとKimonoモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Kimono.count}.by(1)
      # 着物一覧ページ（トップページ）に遷移することを確認する
      expect(current_path).to eq root_path
      # 着物一覧ページに先ほど登録した着物が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.png']")
      # 着物一覧ページに先ほど登録した着物が存在することを確認する（種類名）
      expect(page).to have_content('小紋')
    end
  end

  context '着物の登録ができないとき' do
    scenario 'ログインしていないと着物登録画面に遷移できない' do
      # 着物登録画面へ遷移するボタンがあることを確認する
      visit root_path
      expect(page).to have_content('着物をしまう')
      # 着物登録画面に移動する
      visit new_kimono_path
      # ログイン画面に遷移していることを確認する
      expect(current_path).to eq  new_user_session_path
    end
  end
end