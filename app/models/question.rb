class Question < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :body

  validates :body, length: { in: 3..250 }
end
