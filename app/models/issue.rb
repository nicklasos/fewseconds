class Issue < ActiveRecord::Base
  include Paperclip::Glue

  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, reject_if: ->(a) { a[:body].blank? }, allow_destroy: true

  belongs_to :user

  attr_accessible :image, :instructions, :name, :questions_attributes

  has_attached_file :image , styles: { thumb: "200x200>" }

  validates :image, attachment_presence: true
  validates :name, presence: true

  validate :min_and_max_questions

  private

  def min_and_max_questions
    errors.add(:base, I18n.t('errors.issue.to_short')) if questions.size < 1
    errors.add(:base, I18n.t('errors.issue.to_long')) if questions.size > 5
  end
end
