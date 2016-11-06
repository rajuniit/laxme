class Finance::StudentFeeDiscount < ApplicationRecord
  belongs_to :receiver ,:class_name=>'Student'

  validates_presence_of  :receiver_id , :message => "#{I18n.t('student_admission_no_cant_be_blank')}"

  validates_uniqueness_of :name, :scope=>[:finance_fee_category_id, :type, :receiver_id ]
end
