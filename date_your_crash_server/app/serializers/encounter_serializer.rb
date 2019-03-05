class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :friend_id, :duration, :time, :friend_name


end
