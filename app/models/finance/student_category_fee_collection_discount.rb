class Finance::StudentCategoryFeeCollectionDiscount < ApplicationRecord
  belongs_to :receiver ,:class_name=>'StudentCategory'
  validates_presence_of  :receiver_id , :message => "#{I18n.t('student_category_cant_be_blank')}"
end
