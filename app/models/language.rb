class Language < ApplicationRecord
  scope :translation_available, -> { where(:code => Configuration::LOCALES) }
end
