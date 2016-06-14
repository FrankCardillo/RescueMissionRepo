require 'rails_helper'

feature "user adds answer to question" do
  let(:question1) {Question.create(asker: "Frank", title: "B" * 40, body: "C" * 150)}

  scenario "user adds answer to question" do
    question1
    visit '/questions'
    click_link question1.title
    fill_in "Answerer", with: "Keane"
    fill_in "Answer Body", with: "C" * 50
    click_button "Create Answer"
    expect(page).to have_content("Keane")
    expect(page).to have_content("C" * 50)
  end
end
