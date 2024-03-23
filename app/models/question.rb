class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { maximum: 25}
  validates :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "solved", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["answers", "user"]
  end
end
