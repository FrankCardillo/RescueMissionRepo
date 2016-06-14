require 'rails_helper'

feature "user visits specific question page" do
  let(:question1) {Question.create(asker: "Frank", title: "B" * 40, body: "C" * 150)}
  let(:answer1) {Answer.create(answerer: "Keane", body: "Z" * 50, question_id: question1.id)}

  scenario "user visits specific question page" do
    question1
    visit '/questions'
    click_link question1.title
    expect(page).to have_content("Frank")
  end

  scenario "user sees answers to specific question" do
    question1
    answer1
    visit '/questions'
    click_link question1.title
    expect(page).to have_content("Keane")
  end

  scenario "user deletes question" do
    question1
    answer1
    visit '/questions'
    click_link question1.title
    click_button "delete"
    expect(page).not_to have_content(question1.title)
    expect(page).to have_content("All Questions")
  end

  scenario "user edits question" do
    question1
    answer1
    visit '/questions'
    click_link question1.title
    fill_in "Body", with: "Z" * 150
    click_button "Update Question"
    expect(page).to have_content("Z" * 150)
  end
end
