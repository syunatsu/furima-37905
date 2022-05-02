require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, last_name, first_name,
          last_name_kana, first_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが重複すると登録できない' do
        @user.save
        additional_user = FactoryBot.build(:user)
        additional_user.email = @user.email
        additional_user.valid?
        expect(additional_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailには@を含まないと登録できない' do
        @user.email = 'test.email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'aa11'
        @user.password_confirmation = 'aa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordは半角アルファベットだけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワードa1'
        @user.password_confirmation = 'パスワードa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameは全角で入力しないと登録できない' do
        @user.last_name = 'ohira'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は不正な値です')
      end
      it 'first_nameは全角で入力しないと登録できない' do
        @user.first_name = 'yuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'last_name_kanaは全角カタカナで入力しないと登録できない' do
        @user.last_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）は不正な値です')
      end
      it 'first_name_kanaは全角カタカナで入力しないと登録できない' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
