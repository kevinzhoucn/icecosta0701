class Resume
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :resume_type, type: String
  field :position_id, type: String
  belongs_to :postion
  
  mount_uploader :avatar, AvatarUploader
end
