class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :gist_id, :user, :question, presence: true
end
