class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 100 }

    scope :search_by_title, ->(query) { where('title ILIKE ?', "%#{query}%") }
  end