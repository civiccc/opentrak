require 'spec_helper'

describe "access_tokens/show.html.erb" do
  before(:each) do
    @access_token = assign(:access_token, stub_model(AccessToken,
      :user_id => 1,
      :token => "Token",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Token/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
