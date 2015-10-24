class Service
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :lang, type: String

  def self.find_en()
    # where(lang: 'en')
    not_in(lang: 'cn')
  end

  def self.find_cn()
    # where(lang: 'cn')
    not_in(lang: 'en')
  end

  def self.find_by_lang(lang)
    where(lang: lang)
  end

end
