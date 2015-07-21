class Slide
  include Mongoid::Document
  field :title, type: String
  field :image_url, type: String
  field :sub_title, type: String
  field :picture_id, type: String

  mount_uploader :avatar, AvatarUploader
  belongs_to :picture
end
