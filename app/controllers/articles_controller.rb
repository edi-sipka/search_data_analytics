class ArticlesController < ApplicationController  
    def index
      if query_param.present?
        save_search if valid_search_request?

        @articles = Article.search_by_title(query_param).limit(50)
      else
        @articles = Article.limit(20)
      end
    end
  
    private

    def query_param
      params[:query]&.strip
    end

    def latest_search
      @latest_search ||= Search.latest_search_for(current_user)
    end
  
    def save_search
      if latest_search.nil? || !related_article(latest_search.query, query_param)
        Search.create(query: query_param.strip, user: current_user)
      else
        latest_search.update(query: query_param)
      end
    end
  
    def valid_search_request?
      query_param.length >= 2 && (latest_search.nil? || !latest_search.query.include?(query_param) || latest_search.query.length < query_param.length)
    end

    def related_article(str1, str2)
      jarow = FuzzyStringMatch::JaroWinkler.create(:native)
      distance = jarow.getDistance(str1, str2)
      distance > 0.8
    end
  end