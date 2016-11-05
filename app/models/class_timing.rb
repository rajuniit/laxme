class ClassTiming < ApplicationRecord

  has_many :timetable_entries, :dependent=>:destroy
  belongs_to :batch

  validates_presence_of :name
  validates_uniqueness_of :name,  :scope => [:batch_id , :is_deleted]

  named_scope :for_batch, lambda { |b| { :conditions => { :batch_id => b.to_i, :is_deleted=>false, :is_break => false},  :order =>'start_time ASC' } }
  named_scope :default, :conditions => { :batch_id => nil, :is_break => false, :is_deleted=>false  }, :order =>'start_time ASC'
  named_scope :active_for_batch, lambda { |b| { :conditions => { :batch_id => b.to_i, :is_deleted=>false},  :order =>'start_time ASC' } }
  named_scope :active, :conditions => { :batch_id => nil, :is_deleted=>false  }, :order =>'start_time ASC'

end
