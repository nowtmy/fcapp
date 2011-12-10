require 'spec_helper'

describe "roles/show.html.erb" do
  before(:each) do
    @role = assign(:role, stub_model(Role,
      :user_id => 1,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
  end
end
