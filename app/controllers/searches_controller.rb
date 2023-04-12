class SearchesController < ApplicationController
  def index
    @searches = Search.where(user: current_user).search_count_descending.limit(50)
  end
end