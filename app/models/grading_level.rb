class GradingLevel < ApplicationRecord
  belongs_to :batch

  validates_presence_of :name, :min_score
  validates_presence_of :credit_points, :if=>:batch_has_gpa
  validates_uniqueness_of :name, :scope => [:batch_id, :is_deleted],:case_sensitive => false

  default_scope { where(:order => 'min_score desc') }
  scope   :default, -> { where(:batch_id => nil, :is_deleted => false) }
  scope   :for_batch, -> (b) { where(:batch_id => b.to_i, :is_deleted => false) }
end
