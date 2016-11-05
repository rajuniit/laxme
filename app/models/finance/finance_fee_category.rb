class Finance::FinanceFeeCategory < ApplicationRecord
  belongs_to :batch
  belongs_to :student
#
  has_many   :fee_particulars, :class_name => "FinanceFeeParticular"
  has_many   :fee_collections, :class_name => "FinanceFeeCollection"
  has_many   :fee_discounts

  cattr_reader :per_page

  @@per_page = 10

  validates_presence_of :name
  validates_presence_of :batch_id,:message=>"#{t('not_specified')}"
  validates_uniqueness_of :name, :scope=>[:batch_id, :is_deleted],:if=> 'is_deleted == false'
end
