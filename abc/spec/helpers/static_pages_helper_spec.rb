require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base title" do
      full_title("foo").should =~ /^ABC Application/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end
  end


describe StaticPagesHelper do
#  pending "add some examples to (or delete) #{__FILE__}"
end

end
