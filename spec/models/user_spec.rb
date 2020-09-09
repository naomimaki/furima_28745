require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'すべての入力項目に情報が存在する' do
      expect(@user).to be_valid
    end

    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailの中に@が含まれる' do
      expect(@user.email).to include('@')
    end
    it '＠がなければ登録できない' do
      @user.email = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa000'
      expect(@user).to be_valid
    end
    it 'passwordが5文字だと登録できない' do
      @user.password = 'aa000'
      @user.password_confirmation = 'aa000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合であれば登録できる' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa000'
      expect(@user).to be_valid
    end
    it 'passwordが半角数字のみあれば登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
    end
    it 'passwordが半角英字のみあれば登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
    end

    it 'last_nameが全角であれば登録できる' do
      @user.last_name = 'あ'
      expect(@user).to be_valid
    end
    it 'last_nameが半角であれば登録できない' do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_nameが全角であれば登録できる' do
      @user.first_name = 'あ'
      expect(@user).to be_valid
    end
    it 'first_nameが半角であれば登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_name_kanaがカタカナであれば登録できる' do
      @user.last_name_kana = 'ア'
      expect(@user).to be_valid
    end
    it 'last_name_kanaがひらがなであれば登録できない' do
      @user.last_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end

    it 'first_name_kanaがカタカナであれば登録できる' do
      @user.first_name_kana = 'ア'
      expect(@user).to be_valid
    end
    it 'first_name_kanaがひらがなであれば登録できない' do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end

    it 'nicknameがなければ登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'birth_dateがなければ登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
