class User < ApplicationRecord
  attr_accessor :password, :role, :old_password, :new_password, :confirm_password

  validates_uniqueness_of :username #, :email
  validates_length_of     :username, :within => 1..20
  validates_length_of     :password, :within => 4..40, :allow_nil => true
  validates_format_of     :username, :with => /^[A-Z0-9_-]*$/i,
                          :message => "#{t('must_contain_only_letters')}"
  validates_format_of     :email, :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,   :allow_blank=>true,
                          :message => "#{t('must_be_a_valid_email_address')}"
  validates_presence_of   :role , :on=>:create
  validates_presence_of   :password, :on => :create

  has_and_belongs_to_many :privileges
  has_many  :user_events
  has_many  :events,:through=>:user_events
  has_one :student_record,:class_name=>"Student",:foreign_key=>"user_id"
  has_one :employee_record,:class_name=>"Employee",:foreign_key=>"user_id"

end
