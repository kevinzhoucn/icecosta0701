class Resume
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :resume_type, type: String
  
  mount_uploader :avatar, AvatarUploader
end
