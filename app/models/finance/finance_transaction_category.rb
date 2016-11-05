class Finance::FinanceTransactionCategory < ApplicationRecord
  has_many :finance_transactions,:class_name => 'FinanceTransaction', :foreign_key => 'category_id'
  has_one  :trigger, :class_name => "FinanceTransactionTrigger", :foreign_key => "category_id"


  validates_presence_of :name
  validates_uniqueness_of  :name, :case_sensitive => false

  named_scope :expense_categories, :conditions => "is_income = false AND name NOT LIKE 'Salary'and deleted = 0"
end
