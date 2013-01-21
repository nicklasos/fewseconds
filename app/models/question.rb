class Question < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :body

  validates :body, length: { in: 3..250 }

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
end
