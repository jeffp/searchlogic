require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Searchlogic::NamedScopes::OrConditions do
  before do
    @user = User.create(:username => 'Test')
  end
  it "should find the User if either username or name matches" do
    User.name_or_username_like('Tes').count.should == 1
    User.name_or_username_like('Tes').first.should == @user
  end

  it "should not find the created User if the name or username don't match" do
    User.name_or_username_like('Tex').count.should == 0
  end

  it "should provide a valid sql when dealing with equal queries" do
    User.name_or_username_equals('Test').count.should == 1
    User.name_or_username_like('Test').first.should == @user
  end

  it "should not find a user with equals when the name is not the same" do
    User.name_or_username_equals('Tes').count.should == 0
  end

end