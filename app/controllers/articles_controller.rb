class ArticlesController < ApplicationController  
  
  def index
    if query_param.present?
      save_search if valid_search_request?
      @articles = Article.search_by_title(query_param).limit(50)
    else
      @articles = Article.limit(9)
    end
  end
  
  private

  def query_param
    params[:query]&.strip
  end

  def latest_search
    @latest_search ||= Search.in_descending_order_by(current_user).first
  end
  
  def save_search
    if should_create_new_search?
      Search.create(query: query_param.strip, user: current_user)
    else
      latest_search.update(query: query_param.strip)
    end
  end
  
  def should_create_new_search?
    latest_search.blank? || !related_article(latest_search&.query, query_param)
  end

  def valid_search_request?
    return true unless latest_search.present?
    query_param_length = query_param.to_s.length
    !latest_search.query.include?(query_param) || latest_search.query.length < query_param_length
  end

  def related_article(str1, str2)
    jarow = FuzzyStringMatch::JaroWinkler.create(:native)
    distance = jarow.getDistance(str1, str2)
    distance > 0.8
  end
end