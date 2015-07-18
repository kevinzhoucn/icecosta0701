class Picture
  include Mongoid::Document
  field :key, type: String
  field :value, type: String

  mount_uploader :avatar, AvatarUploader
end
