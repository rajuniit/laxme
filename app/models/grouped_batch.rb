class GroupedBatch < ApplicationRecord
  belongs_to :batch_group
  belongs_to :batch

  validates_presence_of :batch_group_id, :batch_id
end
