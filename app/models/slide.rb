class Slide
  include Mongoid::Document
  field :title, type: String
  field :image_url, type: String
  field :sub_title, type: String
  field :picture_id, type: String
  field :nav_type, type: String

  mount_uploader :avatar, AvatarUploader
  belongs_to :picture

  scope :shows, -> { where(:nav_type => nil) }

  def self.find_by_type(key)
    where(nav_type: key.to_s).first
  end

  def self.get_bar_image(key)
    obj = find_by_type(key)
    obj = create(nav_type: key, title: "", sub_title: "") unless obj
    return obj
  end
end
