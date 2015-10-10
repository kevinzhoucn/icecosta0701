class Position
  include Mongoid::Document
  #added timestamp -- by albert
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :position_type, type: String
  has_many :resumes

  def self.search(search)
    if search
      where(title: /#{search}/i)
    else
      all
    end
  end
end
