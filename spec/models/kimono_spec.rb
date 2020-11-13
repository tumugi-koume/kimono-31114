require 'rails_helper'
RSpec.describe Kimono, type: :model do
  before do
    @kimono = FactoryBot.build(:kimono)
  end

  describe '着物登録' do
    it 'kimono_name_idとimageがあれば保存できること' do
    end

    it 'kimono_genre_idが空でも保存できること' do
    end

    it 'tpo_idが空でも保存できること' do
    end

    it 'color_patternが空でも保存できること' do
    end

    it 'seasonが空でも保存できること' do
    end

    it 'material_idが空でも保存できること' do
    end

    it 'wore_dateが空でも保存できること' do
    end

    it 'cleaned_dateが空でも保存できること' do
    end

    it 'memoが空でも保存できること' do
    end

    it 'kimono_name_idが---だと保存されないこと' do
    end

    it 'imageがないと保存されないこと' do
    end

    it 'userが紐づいていないと保存されないこと' do
    end

  end
end
