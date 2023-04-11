class SearchesController < ApplicationController
    def index
      @searches = Search.search_count_descending.limit(30)
    end
  end