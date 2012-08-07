require 'spec_helper'

describe "Static pages" do

  describe "About page" do

    it "should have the content 'about'" do
      visit '/about'
      page.should have_content('about')
    end
  end

describe "Contact page" do

    it "should have the content 'contact'" do
      visit '/contact'
      page.should have_content('contact')
    end
  end

describe "Home page" do

    it "should have the content 'home'" do
      visit '/home'
      page.should have_content('home')
    end
  end

end
