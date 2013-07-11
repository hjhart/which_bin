class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :bin_id
end