class ArchivedStudent < ApplicationRecord

  include CceReportMod

  belongs_to :country
  belongs_to :batch
  belongs_to :student_category
  belongs_to :nationality, :class_name => 'Country'
  has_many :archived_guardians, :foreign_key => 'ward_id', :dependent => :destroy
  has_one :immediate_contact

  has_many   :students_subjects, :primary_key=>:former_id, :foreign_key=>'student_id'
  has_many   :subjects ,:through => :students_subjects

  has_many   :cce_reports, :primary_key=>:former_id, :foreign_key=>'student_id'
  has_many   :assessment_scores, :primary_key=>:former_id, :foreign_key=>'student_id'
  has_many   :exam_scores, :primary_key=>:former_id, :foreign_key=>'student_id'

  before_save :is_active_false

  #has_and_belongs_to_many :graduated_batches, :class_name => 'Batch', :join_table => 'batch_students',:foreign_key => 'student_id' ,:finder_sql =>'SELECT * FROM `batches`,`archived_students`  INNER JOIN `batch_students` ON `batches`.id = `batch_students`.batch_id WHERE (`batch_students`.student_id = `archived_students`.former_id )'

  has_attached_file :photo,
                    :styles => {
                        :thumb=> "100x100#",
                        :small  => "150x150>"},
                    :url => "/system/:class/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension"

  def is_active_false
    unless self.is_active==0
      self.is_active=0
    end
  end

end
