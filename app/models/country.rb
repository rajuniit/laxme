class Country < ApplicationRecord

  GRADINGTYPES = {"1"=>"GPA","2"=>"CWA","3"=>"CCE"}

  validates_presence_of :course_name, :code
  validate :presence_of_initial_batch, :on => :create

  has_many :batches
  has_many :batch_groups
  has_many :ranking_levels
  has_many :class_designations
  has_many :subject_amounts
  accepts_nested_attributes_for :batches
  has_and_belongs_to_many :observation_groups
  has_and_belongs_to_many_with_deferred_save :cce_weightages

  before_save :cce_weightage_valid

  named_scope :active, :conditions => { :is_deleted => false }, :order => 'course_name asc'
  named_scope :deleted, :conditions => { :is_deleted => true }, :order => 'course_name asc'
  named_scope :cce, {:select => "courses.*",:conditions=>{:grading_type => GRADINGTYPES.invert["CCE"]}, :order => 'course_name asc'}

  def presence_of_initial_batch
    errors.add_to_base "#{t('should_have_an_initial_batch')}" if batches.length == 0
  end

  def inactivate
    update_attribute(:is_deleted, true)
  end

  def full_name
    "#{course_name} #{section_name}"
  end

  def active_batches
    self.batches.all(:conditions=>{:is_active=>true,:is_deleted=>false})
  end

  def has_batch_groups_with_active_batches
    batch_groups = self.batch_groups
    if batch_groups.empty?
      return false
    else
      batch_groups.each do|b|
        return true if b.has_active_batches==true
      end
    end
    return false
  end

end
