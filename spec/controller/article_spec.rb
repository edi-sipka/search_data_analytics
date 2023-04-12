require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    context 'when query param is present and valid search request' do
      let(:query) { 'Future world' }

      before do
        allow(controller).to receive(:query_param).and_return(query)
        allow(controller).to receive(:valid_search_request?).and_return(true)
      end

      it 'calls save_search method' do
        expect(controller).to receive(:save_search)
        get :index
      end
    end

    context 'when valid_search_request? is false' do
      before do
        allow(controller).to receive(:query_param).and_return('hello')
        allow(controller).to receive(:valid_search_request?).and_return(false)
      end

      it 'does not call save_search method' do
        expect(controller).not_to receive(:save_search)
        get :index
      end
    end
  end
end
