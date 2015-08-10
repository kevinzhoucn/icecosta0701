class Service
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :lang, type: String

  def self.find_en()
    where(lang: 'en')
  end

  def self.find_cn()
    where(lang: 'cn')
  end
end
