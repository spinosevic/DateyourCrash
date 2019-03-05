class Match < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :matching, :foreign_key => "matching_id", :class_name => "User"
end
