class Timetable < ApplicationRecord
  has_many :timetable_entries , :dependent=>:destroy
  validates_presence_of :start_date
  validates_presence_of :end_date
  default_scope { where(:order=>'start_date ASC') }
end
