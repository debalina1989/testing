require 'spec_helper'

describe "Static pages" do

subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit '/home' }

    let(:heading)    { 'ABC Application' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should have_selector('h1',    text: 'ABC Application') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end


  describe "About page" do
    before { visit '/about' }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About')) }
  end

  describe "Contact page" do
    before { visit '/contact' }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end

end
