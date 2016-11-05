class Privilege < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :privilege_tag
end
