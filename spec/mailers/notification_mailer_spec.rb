require 'rails_helper'

RSpec.describe NotificationMailer, type: :mailer do
  describe 'new_inquiry' do
    let(:mail) do
      @inquiry = build(:inquiry, name: '田中太郎', email: 'sample@example.com', phone: '050-313-66666', message: 'Hi!')
      NotificationMailer.new_inquiry(@inquiry)
    end

    it 'renders the headers' do
      expect(mail.subject).to include '新規問い合わせがありました'
      expect(mail.to).to eq %w(you@youcube.jp youcune@me.com)
      expect(mail.from).to eq %w(noreply@youcube.jp)
    end

    it 'renders the body with the inquiry' do
      expect(mail.body.encoded).to include '新規問い合わせがありましたのでお知らせします。'
      expect(mail.body.encoded).to include '田中太郎'
      expect(mail.body.encoded).to include 'sample@example.com'
      expect(mail.body.encoded).to include '050-313-66666'
      expect(mail.body.encoded).to include 'Hi!'
    end
  end
end
