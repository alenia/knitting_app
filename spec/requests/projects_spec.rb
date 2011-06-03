require 'spec_helper'

describe "projects" do
  it "can create a project" do
    visit projects_path
    click_button "New Project"
    fill_in "project[name]", :with => "Sneed"
    fill_in "project[current_row]", :with => 42
    click_button "Create!"
    page.should have_content "Your Project was Created!"
    page.should have_content "Sneed"
  end
end