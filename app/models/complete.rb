class Complete < ActiveRecord::Base
  attr_accessible :user_id, :issue_id

  belongs_to :issue
  belongs_to :user
end
