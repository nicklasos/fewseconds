class Issue < ActiveRecord::Base
  include Paperclip::Glue

  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

  belongs_to :user

  attr_accessible :image, :instructions, :name, :questions_attributes

  has_attached_file :image , styles: { thumb: "300x200>" }

  validates :image, attachment_presence: true
  validates :name, presence: true

  validate :at_least_one_question

  private

  def at_least_one_question
    errors.add(:base, "You must provide at least one question") if questions.size < 1
  end
end
