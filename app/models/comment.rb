class Comment < ApplicationRecord
  belongs_to :blog
  validates :name, presence: true
  validates :body, presence: true
  validates :email, presence: true
end
