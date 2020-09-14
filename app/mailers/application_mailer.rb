class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <postmaster@mg.govorov.pro>)
  layout 'mailer'
end
