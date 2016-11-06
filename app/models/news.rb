class News < ApplicationRecord
  belongs_to :author, :class_name => 'User'
  has_many :comments, :class_name => 'NewsComment'
  after_save :reload_news_bar
  after_destroy :reload_news_bar

  validates_presence_of :title, :content

  default_scope { where(:order => 'created_at DESC') }

  cattr_reader :per_page
  xss_terminate :except => [:content]
  @@per_page = 12
end
