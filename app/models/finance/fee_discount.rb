class Finance::FeeDiscount < ApplicationRecord
  belongs_to :finance_fee_category
  validates_presence_of :name, :discount, :type
  validates_numericality_of :discount,:less_than_or_equal_to=> 100,:greater_than_or_equal_to=> 1
end
