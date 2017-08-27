# Class Application Mailer
class ApplicationMailer < ActionMailer::Base
  default from: Settings.from_email
  layout "mailer"
end
