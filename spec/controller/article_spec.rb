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

      it 'calls search_by_title on Article with query param' do
        expect(Article).to receive(:search_by_title).with(query).and_call_original
        get :index
      end
    end

    context 'when query param is not present' do
      before do
        allow(controller).to receive(:query_param).and_return(nil)
      end

      it 'does not call save_search method while query params is nil' do
        expect(controller).not_to receive(:save_search)
        get :index
      end

      it 'limits results to 9' do
        expect(Article).to receive(:limit).with(9).and_call_original
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
  
  describe 'should_create_new_search?' do
    subject { controller.send(:should_create_new_search?) }
  
    context 'when latest_search is blank' do
      before do
        allow(controller).to receive(:latest_search).and_return(nil)
      end
  
      it { is_expected.to be_truthy }
    end
  end

  describe 'should_create_new_search?' do
    subject { controller.send(:should_create_new_search?) }
  
    context 'when latest_search is present and related article found' do
      let(:latest_search) { double(query: 'related query') }
  
      before do
        allow(controller).to receive(:latest_search).and_return(latest_search)
        allow(controller).to receive(:related_article).and_return(true)
      end
  
      it { is_expected.to be_falsy }
    end
  end
 end
