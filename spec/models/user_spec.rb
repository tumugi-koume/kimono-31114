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
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空だと登録できないこと' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Confirmation can't be blank")
    end

    it 'nicknameが11文字以上だと登録できないこと' do
      @user.nickname = "あいうえおかきくけこさし"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 10 characters)")
    end

    it '同じemailがすでに登録されていると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = "abc.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが５文字以下だと登録できないこと' do
      @user.password = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end

    it 'passwordは半角英数字混合でないと登録されないこと' do
      @user.password = "あかさたなはま"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = "abcdefgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordとpassword_confirmationが同じでないと登録されないこと' do
      @user.password = "qwe1234"
      @user.password_confirmation = "poi0987"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end
end
