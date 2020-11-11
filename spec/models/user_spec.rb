require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'nickname、email、password、password_confirmationが存在すれば登録できること' do
    end

    it 'nicknameが空だと登録できないこと' do
    end

    it 'emailが空だと登録できないこと' do
    end

    it 'passwordが空だと登録できないこと' do
    end

    it 'password_confirmationが空だと登録できないこと' do
    end

    it 'nicknameが11文字以上だと登録できないこと' do
    end

    it '同じemailがすでに登録されていると登録できないこと' do
    end

    it 'emailに@が含まれていないと登録できないこと' do
    end

    it 'passwordが５文字以下だと登録できないこと' do
    end

    it 'passwordは半角英数字混合でないと登録されないこと' do
    end

    it 'passwordが英字のみでは登録できないこと' do
    end

    it 'passwordが数字のみでは登録できないこと' do
    end

    it 'passwordとpassword_confirmationが同じでないと登録されないこと' do
    end

  end
end
