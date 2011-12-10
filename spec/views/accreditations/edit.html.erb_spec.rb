require 'spec_helper'

describe "accreditations/edit.html.erb" do
  before(:each) do
    @accreditation = assign(:accreditation, stub_model(Accreditation,
      :is_active => false,
      :enrollment_number => "MyString"
    ))
  end

  it "renders the edit accreditation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accreditations_path(@accreditation), :method => "post" do
      assert_select "input#accreditation_is_active", :name => "accreditation[is_active]"
      assert_select "input#accreditation_enrollment_number", :name => "accreditation[enrollment_number]"
    end
  end
end
