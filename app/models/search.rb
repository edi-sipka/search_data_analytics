class Search < ApplicationRecord
  validates :query, presence: true, length: { minimum: 3, maximum: 50 }

  belongs_to :user

  scope :search_count_descending, -> {
    group(:query)
      .select('query, COUNT(*) as total')
      .order('total DESC')
  }

  scope :latest_search_for, -> (user) { where(user: user).order(created_at: :desc).first }
end
