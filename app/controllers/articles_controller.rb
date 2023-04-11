class ArticlesController < ApplicationController
    before_action :logged_user
  
    def index
      if params[:query].present?
        save_query(params[:query])
        @articles = Article.search_by_title(params[:query]).limit(50)
      else
        @articles = Article.default_limit
      end
    end
  
    private
  
    def save_query(query)
      recent_query = @logged_user.searches.order(created_at: :desc).first
      return unless should_save_search_query?(query, recent_query)
  
      if recent_query.nil? 
        Search.create(query: query, user: @logged_user)
      else
        recent_query.update(query: query)
      end
    end
  
    def should_save_search_query?(query, recent_query)
      query.present? && query.length >= 5 && (recent_query.nil? || !recent_query.query.include?(query) || recent_query.query.length < query.length)
    end
  end