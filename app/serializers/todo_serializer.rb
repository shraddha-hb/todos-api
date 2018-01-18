class TodoSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :title, :body       
  #, :created_at, :updated_at #:created_by,
  # model association
  has_many :items
end
