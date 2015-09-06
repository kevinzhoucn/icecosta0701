class Picture
  include Mongoid::Document
  field :key, type: String
  field :value, type: String
  # field :slide_id, type: String

  mount_uploader :avatar, AvatarUploader
  has_one :slide

  def self.find_by_key(key)
    where(key: key.to_s).first
  end

  def self.save_default(key, value)
    create(key: key, value: value.to_s) unless find_by_key(key)
  end

  def self.get_image(key)
    obj = find_by_key(key)
    obj = create(key: key, value: "") unless obj
    return obj
  end
end
