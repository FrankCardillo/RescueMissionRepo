class Question < ActiveRecord::Base
  has_many :answers
  
  validates :asker, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
