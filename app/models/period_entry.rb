class PeriodEntry < ApplicationRecord
  belongs_to :batch
  belongs_to :class_timing
  belongs_to :subject
  belongs_to :employee
end
