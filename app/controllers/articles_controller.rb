class ArticlesController < ApplicationController
    before_action :logged_user

    def index
      if params[:query].present?
        @articles = Article.search_by_title(params[:query]).limit(50)
      else
        @articles = Article.default_limit
      end
    end
  end