# coding: utf-8
class Notifier < ActionMailer::Base
  default from: "tr_reuters@163.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.n_otifier.resume_received.subject
  #
  def resume_received(resume)
    @resume = resume
    mail :to => 'ceo@brivates.com', :subject => '收到一份新简历'
  end

  def enquiry_received(enquiry)
    @enquiry = enquiry
    mail :to => 'ceo@brivates.com', :subject => '收到一条新咨询信息'
  end
  # 20150105 Albert 添加了招商加盟email提醒功能
  def affiliate_received(affiliate)
    @affiliate = affiliate
    mail :to => 'ceo@brivates.com', :subject => '收到一个新的加盟申请'
  end
end
