require 'rails_helper'

RSpec.describe 'searches/index.html.erb', type: :view do
  before do
    @searches = []
    render
  end

  it 'heading of recent searches' do
    expect(rendered).to have_selector('.search-data .heading-search h1.heading-article', text: 'List of recent searches')
  end
end
