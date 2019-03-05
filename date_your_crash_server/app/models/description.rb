class Description < ApplicationRecord
  belongs_to :desc, polymorphic: true
end
