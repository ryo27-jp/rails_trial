class Article < ApplicationRecord
  belongs_to :user

  enum status: { publish: 0, non_published: 1 }

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 100 }
  validates :status, presence: true
end
