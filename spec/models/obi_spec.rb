require 'rails_helper'
RSpec.describe Obi, type: :model do
  before do
    @obi = FactoryBot.build(:obi)
  end

  describe '帯登録' do
    it 'obi_name_idとimageがあれば保存できること' do
      expect(@obi).to be_valid
    end

    it 'tpo_idが空でも保存できること' do
      @obi.tpo_id = nil
      expect(@obi).to be_valid
    end

    it 'color_patternが空でも保存できること' do
      @obi.color_pattern = nil
      expect(@obi).to be_valid
    end

    it 'seasonが空でも保存できること' do
      @obi.season = nil
      expect(@obi).to be_valid
    end

    it 'material_idが空でも保存できること' do
      @obi.material_id = nil
      expect(@obi).to be_valid
    end

    it 'wore_dateが空でも保存できること' do
      @obi.wore_date = nil
      expect(@obi).to be_valid
    end

    it 'cleaned_dateが空でも保存できること' do
      @obi.cleaned_date = nil
      expect(@obi).to be_valid
    end

    it 'memoが空でも保存できること' do
      @obi.memo = nil
      expect(@obi).to be_valid
    end

    it 'obi_name_idが---だと保存されないこと' do
      @obi.obi_name_id = 1
      @obi.valid?
      expect(@obi.errors.full_messages).to include("種類は1以外の値にしてください")
    end

    it 'imageがないと保存されないこと' do
      @obi.image = nil
      @obi.valid?
      expect(@obi.errors.full_messages).to include("画像を入力してください")
    end

    it 'userが紐づいていないと保存されないこと' do
      @obi.user = nil
      @obi.valid?
      expect(@obi.errors.full_messages).to include("ユーザーを入力してください")
    end
  end
end
