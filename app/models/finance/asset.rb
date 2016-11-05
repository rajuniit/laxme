class Finance::Asset < ApplicationRecord
  validates_presence_of :title, :amount
  validates_numericality_of :amount
end
