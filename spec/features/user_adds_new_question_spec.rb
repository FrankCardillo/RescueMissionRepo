require 'rails_helper'

feature "user adds a new question" do
  scenario "user successfully adds a new question" do

    visit '/questions'
    fill_in "Asker", with: "Frank"
    fill_in "Title", with: "D" * 40
    fill_in "Body", with: "C" * 150
    click_button "Create Question"
    expect(page).to have_content("D" * 40)
  end

  scenario "user unsuccessfully adds a new question" do
    visit '/questions'
    fill_in "Asker", with: "Frank"
    click_button "Create Question"
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
