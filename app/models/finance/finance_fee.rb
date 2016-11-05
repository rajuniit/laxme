class Finance::FinanceFee < ApplicationRecord
  belongs_to :finance_fee_collection ,:foreign_key => 'fee_collection_id'
  has_many   :finance_transactions ,:as=>:finance
  has_many :components, :class_name => 'FinanceFeeComponent', :foreign_key => 'fee_id'
  belongs_to :student
end
