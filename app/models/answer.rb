class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id
  belongs_to :question
  belongs_to :user

  validates :body, presence: true
end
