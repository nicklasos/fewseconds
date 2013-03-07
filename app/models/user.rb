class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :issues
  has_many :answers

  has_many :completes
  has_many :completed, through: :completes, source: :issue

  # User can't answer twice on the same issue and can't answer the questions that he has created
  def completed_issue?(issue)
    Complete.where(user_id: self.id, issue_id: issue.id).any? or self.id.eql? issue.user_id
  end
end
