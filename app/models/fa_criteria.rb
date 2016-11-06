class FaCriteria < ApplicationRecord

  has_many    :descriptive_indicators,  :as=>:describable
  has_many    :assessment_scores, :through=>:descriptive_indicators
  accepts_nested_attributes_for :descriptive_indicators
  has_many :cce_reports , :as=>:observable
  belongs_to :fa_group

  default_scope :order=>'sort_order ASC'
  scope :active, -> { where(:is_deleted=>false) }

  validates_presence_of :fa_group_id

end
