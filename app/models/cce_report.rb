class CceReport < ApplicationRecord

  belongs_to :batch
  belongs_to :student
#  has_and_belongs_to_many   :exams
  belongs_to :observable, :polymorphic => true
  belongs_to :exam

  scope :scholastic, -> { where(:observable_type => "FaCriteria") }
  scope :coscholastic, -> { where(:observable_type => "Observation") }

end
