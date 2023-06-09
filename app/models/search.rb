class Search < ApplicationRecord
  validates :query, presence: true, length: { minimum: 3, maximum: 50 }

  belongs_to :user

  scope :search_count_descending, -> {
    group(:query)
      .select('query, COUNT(*) as total')
      .order('total DESC')
  }

  scope :in_descending_order_by, -> (user) { where(user: user).order(created_at: :desc) }
end
