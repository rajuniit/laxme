class Finance::FinanceFeeParticular < ApplicationRecord
  belongs_to :finance_fee_category
  belongs_to :student_category
  validates_presence_of :name,:amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :message => "#{I18n.t('must_be_positive')}"
  cattr_reader :per_page
  @@per_page = 10
end
