class Language < ApplicationRecord
  named_scope :translation_available, :conditions => { :code => Configuration::LOCALES }
end
