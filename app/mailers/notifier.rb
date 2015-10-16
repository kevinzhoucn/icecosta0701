# coding: utf-8
class Notifier < ActionMailer::Base
  default from: "tr_reuters@163.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.n_otifier.resume_received.subject
  #
  def resume_received(resume, position)
    @resume = resume
    @position = position
    mail :to => 'hr@ipa-cro.com', :subject => '收到一份来自本公司官网的简历'
  end
end
