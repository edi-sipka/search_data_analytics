class Search < ApplicationRecord
    validates :query, presence: true, length: { minimum: 1, maximum: 100 }
  
    belongs_to :user
  end