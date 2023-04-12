require 'rails_helper'

RSpec.describe 'articles/index.html.erb', type: :view do
  before do
    assign(:articles, [])
    render
  end

  it 'main page welcome heading' do
    expect(rendered).to have_selector('.header h1', text: 'Welcome to SimpleSearch')
  end

  it 'main page search bar' do
    expect(rendered).to have_selector('.header input[type="text"][name="query"][placeholder="Search articles..."]')
  end

  it 'main page latest topics' do
    expect(rendered).to have_selector('.header h3.popular-topics', text: 'Green Living, Future Tech, Urban Evolution.')
  end
end
