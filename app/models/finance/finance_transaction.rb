class Finance::FinanceTransaction < ApplicationRecord
  belongs_to :category, :class_name => 'FinanceTransactionCategory', :foreign_key => 'category_id'
  belongs_to :student
  belongs_to :finance, :polymorphic => true
  belongs_to :payee, :polymorphic => true
  cattr_reader :per_page
  validates_presence_of :title,:amount,:transaction_date
  validates_presence_of :category,:message=>"#{t('not_specified')}."
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :message => "#{t('must_be_positive')}"

  after_create  :create_auto_transaction
  after_update  :update_auto_transaction
  after_destroy :delete_auto_transaction
  after_create :add_voucher_or_receipt_number
end
