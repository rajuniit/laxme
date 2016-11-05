class Finance::FinanceFeeStructureElement < ApplicationRecord
  belongs_to :batch
  belongs_to :student_category
  belongs_to :student
  belongs_to :finance_fee
  belongs_to :parent, :class_name => 'FinanceFeeStructureElement'
  belongs_to :fee_collection, :class_name => 'FinanceFeeCollection'
  has_one    :descendant, :class_name => 'FinanceFeeStructureElement', :foreign_key => 'parent_id'
end
