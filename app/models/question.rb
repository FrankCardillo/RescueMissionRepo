class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy

  validates :asker, presence: true
  validates :title, presence: true
  validates :title, length: { minimum: 40 }
  validates :body, presence: true
  validates :body, length: { minimum: 150 }
end
