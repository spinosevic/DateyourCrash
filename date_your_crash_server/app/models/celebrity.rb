class Celebrity < ApplicationRecord
  has_many :user_celebrities
  has_many :users, through: :user_celebrities
  has_many :descriptions, as: :desc, :dependent => :destroy
end
