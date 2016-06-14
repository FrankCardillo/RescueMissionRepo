class Answer < ActiveRecord::Base
  belongs_to :question

  validates :answerer, presence: true
  validates :question_id, presence: true
  validates :body, presence: true
  validates :body, length: { minimum: 50 }
end
