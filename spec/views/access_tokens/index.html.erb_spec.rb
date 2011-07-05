require 'spec_helper'

describe "access_tokens/index.html.erb" do
  before(:each) do
    assign(:access_tokens, [
      stub_model(AccessToken,
        :user_id => 1,
        :token => "Token",
        :active => false
      ),
      stub_model(AccessToken,
        :user_id => 1,
        :token => "Token",
        :active => false
      )
    ])
  end

  it "renders a list of access_tokens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
