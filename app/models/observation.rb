class Observation < ApplicationRecord
  belongs_to  :observation_group
  has_many    :descriptive_indicators,  :as=>:describable
  has_many    :assessment_scores, :through=>:descriptive_indicators
  accepts_nested_attributes_for :descriptive_indicators
  has_many    :cce_reports, :as=>:observable

  default_scope :order=>'sort_order ASC'
  named_scope :active,:conditions=>{:is_active=>true}
end
