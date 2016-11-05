class Finance::StudentCategoryFeeDiscount < ApplicationRecord
  belongs_to :receiver ,:class_name=>'StudentCategory'
  validates_presence_of  :receiver_id , :message => "#{t('student_category_cant_be_blank')}"

  validates_uniqueness_of :name, :scope=>[:finance_fee_category_id, :type]
end
