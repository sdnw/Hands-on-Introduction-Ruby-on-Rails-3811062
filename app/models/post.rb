class Post < ApplicationRecord
  validates :description, :image, presence: true
  validates :description, length: { minimum:5 }
  validate :description_must_be_at_least_three_words

  has_one_attached :image

  def description_must_be_at_least_three_words
    if description.split.size < 3
      errors.add(:description, "must be at least 3 words")
    end
  end
end
