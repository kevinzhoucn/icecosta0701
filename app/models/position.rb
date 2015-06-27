class Position
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :position_type, type: String
end
