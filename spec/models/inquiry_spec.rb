require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'Validations' do
    it 'is valid' do
      expect(build(:inquiry)).to be_valid
    end

    describe 'presence' do
      it '名前がないと invalid' do
        expect(build(:inquiry, name: nil)).to have(1).error_on(:name)
      end

      it 'Eメールアドレスがなくても valid' do
        expect(build(:inquiry, email: nil)).to be_valid
      end

      it '電話番号がなくても valid' do
        expect(build(:inquiry, phone: nil)).to be_valid
      end

      it 'Eメールアドレスと電話番号が両方ともないと invalid' do
        inquiry = build(:inquiry, email: nil, phone: nil)
        expect(inquiry).to have(1).error_on(:email)
        expect(inquiry).to have(1).error_on(:phone)
      end

      it 'メッセージがないと invalid' do
        expect(build(:inquiry, message: nil)).to have(1).error_on(:message)
      end
    end

    describe 'length' do
      it '名前は256文字まで' do
        expect(build(:inquiry, name: 'あ' * 256)).to be_valid
        expect(build(:inquiry, name: 'あ' * 257)).to have(1).error_on(:name)
      end

      it 'Eメールアドレスは256文字まで' do
        expect(build(:inquiry, email: 'a' * 244 + '@example.com')).to be_valid
        expect(build(:inquiry, email: 'a' * 245 + '@example.com')).to have(1).error_on(:email)
      end

      it '電話番号は32文字まで' do
        expect(build(:inquiry, phone: '0' * 32)).to be_valid
        expect(build(:inquiry, phone: '0' * 33)).to have(1).error_on(:phone)
      end

      it 'メッセージは4096文字まで' do
        expect(build(:inquiry, message: 'あ' * 4096)).to be_valid
        expect(build(:inquiry, message: 'あ' * 4097)).to have(1).error_on(:message)
      end
    end

    describe 'format' do
      it 'Eメールアドレスは全角で入れても半角で保持するため valid' do
        inquiry = build(:inquiry, email: 'ｙｏｕ＠ｙｏｕｃｕｂｅ．ｊｐ')
        expect(inquiry).to be_valid
        expect(inquiry.email).to eq 'you@youcube.jp'
      end

      it '電話番号は全角で入れても半角で保持するため valid' do
        inquiry = build(:inquiry, phone: '＋８１（５０）３１３−６６６６６')
        expect(inquiry).to be_valid
        expect(inquiry.phone).to eq '+81(50)313-66666'
      end

      it '電話番号に数字以外が含まれると invalid' do
        expect(build(:inquiry, phone: 'invalid')).to have(1).error_on(:phone)
      end
    end
  end
end
