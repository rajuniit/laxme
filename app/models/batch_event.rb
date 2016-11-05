class BatchEvent < ApplicationRecord
  belongs_to :batch
  belongs_to :event
end
