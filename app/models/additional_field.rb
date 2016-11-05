# This file is part of the Laxme Application
#
# (c) Laxme <http://www.laxmeschool.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

class AdditionalField < ApplicationRecord

  has_many :additional_field_options, :dependent=>:destroy
  validates_presence_of :name
  validates_format_of     :name, :with => /\A[^~`@%$*()\-\[\]{}"':;\/.,\\=+|]*\z/i,
                          :message => "#{I18n.t('must_contain_only_letters_numbers_space')}"
  validates_uniqueness_of :name,:case_sensitive => false

  accepts_nested_attributes_for :additional_field_options, :allow_destroy=>true

end
