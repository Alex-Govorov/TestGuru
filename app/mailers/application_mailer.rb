class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <zlogr5@gmail.com>)
  layout 'mailer'
end
