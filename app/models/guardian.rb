class Guardian < ApplicationRecord
  belongs_to :country
  belongs_to :ward, :class_name => 'Student'
  belongs_to :user,:dependent=>:destroy, :autosave =>true

  validates_presence_of :first_name, :relation,:ward_id
  validates_format_of     :email, :with => /\A[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i,   :allow_blank=>true,
                          :message => "#{I18n.t('must_be_a_valid_email_address')}"
  before_destroy :immediate_contact_nil
end
