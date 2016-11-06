class Finance::FinanceDonation < ApplicationRecord
  belongs_to :custom_transaction, :class_name => 'FinanceTransaction',  :dependent => :destroy
  validates_presence_of :donor, :amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :message => "#{I18n.t('must_be_positive')}"

  before_create :create_finance_transaction

  def create_finance_transaction
    custom_transaction = FinanceTransaction.create(
        :title => "#{I18n.t('donation_from')}" + donor,
        :description => description,
        :amount => amount,
        :transaction_date => transaction_date,
        :category => FinanceTransactionCategory.find_by_name('Donation')
    )
    self.transaction_id = custom_transaction.id
  end
end
