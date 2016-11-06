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

  def create_associates

    batch_discounts = BatchFeeDiscount.find_all_by_finance_fee_category_id(self.fee_category_id)
    batch_discounts.each do |discount|
      discount_attributes = discount.attributes
      discount_attributes.delete "type"
      discount_attributes.delete "finance_fee_category_id"
      discount_attributes["finance_fee_collection_id"]= self.id
      BatchFeeCollectionDiscount.create(discount_attributes)
    end
    category_discount = StudentCategoryFeeDiscount.find_all_by_finance_fee_category_id(self.fee_category_id)
    category_discount.each do |discount|
      discount_attributes = discount.attributes
      discount_attributes.delete "type"
      discount_attributes.delete "finance_fee_category_id"
      discount_attributes["finance_fee_collection_id"]= self.id
      StudentCategoryFeeCollectionDiscount.create(discount_attributes)
    end
    student_discount = StudentFeeDiscount.find_all_by_finance_fee_category_id(self.fee_category_id)
    student_discount.each do |discount|
      discount_attributes = discount.attributes
      discount_attributes.delete "type"
      discount_attributes.delete "finance_fee_category_id"
      discount_attributes["finance_fee_collection_id"]= self.id
      StudentFeeCollectionDiscount.create(discount_attributes)
    end
    particlulars = FinanceFeeParticular.find_all_by_finance_fee_category_id(self.fee_category_id,:conditions=>"is_deleted=0")
    particlulars.each do |p|
      particlulars_attributes = p.attributes
      particlulars_attributes.delete "finance_fee_category_id"
      particlulars_attributes["finance_fee_collection_id"]= self.id
      FeeCollectionParticular.create(particlulars_attributes)
    end
  end
end
