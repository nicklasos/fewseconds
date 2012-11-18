class Issue < ActiveRecord::Base
  include Paperclip::Glue

  belongs_to :user
  attr_accessible :image, :instructions, :name

  has_attached_file :image , styles: { thumb: "150x150>" }

  validates :image, attachment_presence: true
  validates :name, presence: true
end
