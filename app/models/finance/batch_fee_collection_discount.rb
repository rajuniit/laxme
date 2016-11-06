class Finance::BatchFeeCollectionDiscount < ApplicationRecord
  belongs_to :receiver ,:class_name=>'Batch'
  validates_presence_of  :receiver_id , :message => "#{I18n.t('batch_cant_be_blank')}"
end
