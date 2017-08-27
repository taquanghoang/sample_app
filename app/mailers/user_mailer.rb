class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t"static_pages.account_activation"
  end

  def password_reset
    @greeting = t"static_pages.hi"
    mail to: Settings.to_email
  end
end
