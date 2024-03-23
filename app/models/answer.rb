class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :body, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["question", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "question_id", "updated_at", "user_id"]
  end
end
