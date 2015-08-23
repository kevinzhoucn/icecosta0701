class Service
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :lang, type: String
end
