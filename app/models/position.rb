class Position
  include Mongoid::Document
  #added timestamp -- by albert
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :position_type, type: String
  field :lang, type: String
  has_many :resumes

  def self.search(search)
    if search
      where(title: /#{search}/i)
    else
      all
    end
  end
  def self.find_en()
    where(lang: 'en')
  end

  def self.find_cn()
    where(lang: 'cn')
  end
end
