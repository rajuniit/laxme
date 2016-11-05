class Finance::FinanceFeeCollection < ApplicationRecord
  belongs_to :batch
  has_many :finance_fees, :foreign_key =>"fee_collection_id",:dependent=>:destroy
  has_many :finance_transactions, :through => :finance_fees
  has_many :students, :through => :finance_fees
  has_many :fee_collection_particulars ,:dependent=>:destroy
  has_many :fee_collection_discounts   ,:dependent=>:destroy
  belongs_to :fee_category,:class_name => "FinanceFeeCategory"
  has_one :event, :as => :origin


  validates_presence_of :name,:start_date,:fee_category_id,:end_date,:due_date

  after_create :create_associates
end
