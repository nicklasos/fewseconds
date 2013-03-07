class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id
  belongs_to :question

  validates :body, presence: true
end
