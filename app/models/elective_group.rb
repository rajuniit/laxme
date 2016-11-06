class ElectiveGroup < ApplicationRecord
  belongs_to :batch
  has_many :subjects

  validates_presence_of :name, :batch_id

  scope :for_batch, ->(b) { where(:batch_id => b, :is_deleted => false) }

  def inactivate
    update_attribute(:is_deleted, true)
  end
end
