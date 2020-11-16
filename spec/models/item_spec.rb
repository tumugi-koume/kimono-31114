require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '小物登録' do
    it 'item_name_idとimageがあれば保存できること' do
      expect(@item).to be_valid
    end

    it 'tpo_idが空でも保存できること' do
      @item.tpo_id = nil
      expect(@item).to be_valid
    end

    it 'color_patternが空でも保存できること' do
      @item.color_pattern = nil
      expect(@item).to be_valid
    end

    it 'seasonが空でも保存できること' do
      @item.season = nil
      expect(@item).to be_valid
    end

    it 'material_idが空でも保存できること' do
      @item.material_id = nil
      expect(@item).to be_valid
    end

    it 'wore_dateが空でも保存できること' do
      @item.wore_date = nil
      expect(@item).to be_valid
    end

    it 'cleaned_dateが空でも保存できること' do
      @item.cleaned_date = nil
      expect(@item).to be_valid
    end

    it 'memoが空でも保存できること' do
      @item.memo = nil
      expect(@item).to be_valid
    end

    it 'obi_name_idが---だと保存されないこと' do
      @item.item_name_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("種類は1以外の値にしてください")
    end

    it 'imageがないと保存されないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it 'userが紐づいていないと保存されないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("ユーザーを入力してください")
    end
  end
end
