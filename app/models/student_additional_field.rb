class StudentAdditionalField < ApplicationRecord
  belongs_to :student
  belongs_to :student_additional_detail
  has_many :student_additional_field_options, :dependent=>:destroy
  validates_presence_of :name
  validates_uniqueness_of :name,:case_sensitive => false
  validates_format_of     :name, :with => /^[^~`@%$*()\-\[\]{}"':;\/.,\\=+|]*$/i,
                          :message => "#{t('must_contain_only_letters_numbers_space')}"
  accepts_nested_attributes_for :student_additional_field_options, :allow_destroy=>true
end
