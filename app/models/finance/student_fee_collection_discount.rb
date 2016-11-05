class Finance::StudentFeeCollectionDiscount < ApplicationRecord
  belongs_to :receiver ,:class_name=>'Student'

  validates_presence_of  :receiver_id , :message => "#{t('student_admission_no_cant_be_blank')}"
end
