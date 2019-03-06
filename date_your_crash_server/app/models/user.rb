class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true

  has_many :user_celebrities
  has_many :users, through: :user_celebrities
  has_many :descriptions, as: :desc, :dependent => :destroy

  has_and_belongs_to_many :matches,
                          :class_name => "User",
                          :join_table => "users_matches",
                          :foreign_key => "user_id",
                          :association_foreign_key => "match_id"

end
