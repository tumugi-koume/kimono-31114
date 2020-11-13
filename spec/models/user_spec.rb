require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'nickname、email、password、password_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワードには英字と数字を含めて設定してください", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'nicknameが11文字以上だと登録できないこと' do
      @user.nickname = "あいうえおかきくけこさし"
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームは10文字以内で入力してください")
    end

    it '同じemailがすでに登録されていると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = "abc.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'passwordが５文字以下だと登録できないこと' do
      @user.password = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
    end

    it 'passwordは半角英数字混合でないと登録されないこと' do
      @user.password = "あかさたなはま"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには英字と数字を含めて設定してください")
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = "abcdefgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには英字と数字を含めて設定してください")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには英字と数字を含めて設定してください")
    end

    it 'passwordとpassword_confirmationが同じでないと登録されないこと' do
      @user.password = "qwe1234"
      @user.password_confirmation = "poi0987"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

  end
end
