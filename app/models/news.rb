class News
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :news_type, type: String
  field :lang, type: String

  scope :mobile_order, -> { desc(:created_at) }

  def self.search(search)
    if search
      where(title: /#{search}/i)
    else
      all
    end
  end

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
