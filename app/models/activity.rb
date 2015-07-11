class Activity
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :activity_type, type: String
  def self.search(search)
    if search
      where(title: /#{search}/i)
    else
      all
    end
  end
end
