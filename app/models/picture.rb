class Picture
  include Mongoid::Document
  field :key, type: String
  field :value, type: String
  # field :slide_id, type: String

  mount_uploader :avatar, AvatarUploader
  has_one :slide
end
