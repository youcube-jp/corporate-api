class NotificationMailer < ActionMailer::Base
  default from: 'noreply@youcube.jp'

  def new_inquiry(inquiry)
    @inquiry = inquiry
    mail to: 'you@youcube.jp, youcune@me.com', subject: '新規問い合わせがありました'
  end
end
