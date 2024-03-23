class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { maximum: 25}
  validates :body, presence: true
end
