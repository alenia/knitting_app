require 'spec_helper'

describe "projects" do
  describe "creating and deleting" do
    it "can create a valid project, end up in the right place, and delete it" do
      visit projects_path
      click_button "New Project"
      fill_in "project[name]", :with => "Sneed"
      fill_in "project[current_row]", :with => 42
      click_button "Create!"
      page.should have_content "Your Project was Created!"
      page.should have_content "Project page for Sneed"
      page.should have_content "42"
      click_button "Back"
      page.should have_content "Projects"
      click_link "Sneed"
      page.should have_content "Project page for Sneed"
      click_button "Delete"
      page.should have_content "Projects"
      page.should_not have_content "Sneed" 
    end
    it "sets zero for the default count if there is no current_row imput" do
      visit new_project_path
      fill_in "project[name]", :with => "Something"
      click_button "Create!"
      page.should have_content "Your Project was Created!"
      page.should have_content "0"
    end
    it "should throw correct message if project name or row is invalid" do
      visit new_project_path
      fill_in "project[name]", :with => "     "
      fill_in "project[current_row]", :with => 42
      click_button "Create!"
      page.should have_content "Post Failed!"
      page.should have_content "Name can't be blank."
      fill_in "project[name]", :with => "Nombre"
      fill_in "project[current_row]", :with => "Fourty"
      click_button "Create!"
      page.should have_content "Current row is not a number."
      fill_in "project[name]", :with => "Nombre"
      fill_in "project[current_row]", :with => "3.14159"
      click_button "Create!"
      page.should have_content "Current row must be an integer."
      fill_in "project[name]", :with => "Nombre"
      fill_in "project[current_row]", :with => "-4"
      click_button "Create!"
      page.should have_content "Current row must be greater than or equal to 0."
    end
  end
  describe "updating" do
    before do
      visit new_project_path
      fill_in "project[name]", :with => "Something"
      click_button "Create!"
    end
    it "should have working +,- buttons" do
      click_link "+"
      page.should have_content "1"
      page.should_not have_content "0"
      click_link "-"
      page.should have_content "0"
      page.should_not have_content "1"
    end
    it "should not let you decrement below zero" do
      click_link "-"
      page.should have_content "0"
      page.should have_content "Current row can't drop below zero"
    end
    it "should have a working edit page" do
      click_button "Edit"
      page.should have_content "Edit Something"
      fill_in "project[name]", :with => "Sneed"
      fill_in "project[current_row]", :with => 42
      click_button "Update!"
      page.should_not have_content "Something"
      page.should have_content "Project page for Sneed"
      page.should have_content "42"
      click_button "Edit"
      fill_in "project[name]", :with => "   "
      fill_in "project[current_row]", :with => 42
      click_button "Update!"
      page.should have_content "Update failed."
    end
  end
end