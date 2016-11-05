class CceGradeSet < ApplicationRecord

  has_many     :observation_groups
  has_many     :cce_grades#,:dependent => :destroy

  validates_presence_of :name

end
