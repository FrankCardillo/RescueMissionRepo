require 'rails_helper'

feature "user sees list of questions" do
  let(:question1) {Question.create(asker: "Frank", title: "B" * 40, body: "C" * 150)}
  scenario "user visits home page" do
    question1
    visit '/questions'

    expect(page).to have_content("B" * 40)
  end
end
