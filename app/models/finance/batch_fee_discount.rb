class Finance::BatchFeeDiscount < ApplicationRecord
  belongs_to :receiver ,:class_name=>'Batch'
  validates_presence_of  :receiver_id , :message => "#{I18n.t('batch_cant_be_blank')}"

  validates_uniqueness_of :name, :scope=>[:receiver_id, :type]

end
