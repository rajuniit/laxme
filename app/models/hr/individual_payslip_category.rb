class Hr::IndividualPayslipCategory < ApplicationRecord
  validates_numericality_of :amount, :allow_nil=>true
end
