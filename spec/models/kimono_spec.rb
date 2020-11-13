require 'rails_helper'
RSpec.describe Kimono, type: :model do
  before do
    @kimono = FactoryBot.build(:kimono)
  end

  describe '着物登録' do
    it 'kimono_name_idとimageがあれば保存できること' do
      expect(@kimono).to be_valid
    end

    it 'kimono_genre_idが空でも保存できること' do
      @kimono.kimono_genre_id = nil
      expect(@kimono).to be_valid
    end

    it 'tpo_idが空でも保存できること' do
      @kimono.tpo_id = nil
      expect(@kimono).to be_valid
    end

    it 'color_patternが空でも保存できること' do
      @kimono.color_pattern = nil
      expect(@kimono).to be_valid
    end

    it 'seasonが空でも保存できること' do
      @kimono.season = nil
      expect(@kimono).to be_valid
    end

    it 'material_idが空でも保存できること' do
      @kimono.material_id = nil
      expect(@kimono).to be_valid
    end

    it 'wore_dateが空でも保存できること' do
      @kimono.wore_date = nil
      expect(@kimono).to be_valid
    end

    it 'cleaned_dateが空でも保存できること' do
      @kimono.cleaned_date = nil
      expect(@kimono).to be_valid
    end

    it 'memoが空でも保存できること' do
      @kimono.memo = nil
      expect(@kimono).to be_valid
    end

    it 'kimono_name_idが---だと保存されないこと' do
      @kimono.kimono_name_id = 1
      @kimono.valid?
      expect(@kimono.errors.full_messages).to include("種類は1以外の値にしてください")
    end

    it 'imageがないと保存されないこと' do
      @kimono.image = nil
      @kimono.valid?
      expect(@kimono.errors.full_messages).to include("画像を入力してください")
    end

    it 'userが紐づいていないと保存されないこと' do
      @kimono.user = nil
      @kimono.valid?
      expect(@kimono.errors.full_messages).to include("ユーザーを入力してください")
    end
  end
end
