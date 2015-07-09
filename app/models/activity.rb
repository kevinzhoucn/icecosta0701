class Activity
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :activity_type, type: String
end
