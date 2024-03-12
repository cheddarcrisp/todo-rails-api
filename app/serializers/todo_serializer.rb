class TodoSerializer < ActiveModel::Serializer
  attributes :url, :title, :completed, :order
end
