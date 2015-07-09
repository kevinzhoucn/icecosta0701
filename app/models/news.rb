class News
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :news_type, type: String
end
