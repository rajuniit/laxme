class Finance::FinanceDonation < ApplicationRecord
  belongs_to :transaction, :class_name => 'FinanceTransaction',  :dependent => :destroy
  validates_presence_of :donor, :amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :message => "#{t('must_be_positive')}"

  before_create :create_finance_transaction
end
