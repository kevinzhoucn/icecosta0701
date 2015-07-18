class Slide
  include Mongoid::Document
  field :title, type: String
  field :image_url, type: String
  field :sub_title, type: String

  mount_uploader :avatar, AvatarUploader
end
