class Question < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 25}
  validates :body, presence: true
end
