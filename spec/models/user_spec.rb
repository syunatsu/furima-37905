require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      
    end
    it 'emailが空では登録できない' do
    end
    it 'emailが重複すると登録できない' do
    end
    it 'emailには@を含まないと登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordが6文字以上でないと登録できない' do
    end
    it 'passwordは半角英数字混合でないと登録できない' do
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
    end
    it 'last_nameが空では登録できない' do
    end
    it 'first_nameが空では登録できない' do
    end
    it 'last_nameは全角で入力しないと登録できない' do
    end
    it 'first_nameは全角で入力しないと登録できない' do
    end
    it 'last_name_kanaが空では登録できない' do
    end
    it 'first_name_kanaが空では登録できない' do
    end
    it 'last_name_kanaは全角カタカナで入力しないと登録できない' do
    end
    it 'first_name_kanaは全角カタカナで入力しないと登録できない' do
    end
    it 'birthdayが空では登録できない' do
    end
  end
end
