require 'rails_helper'

describe "creating a new question" do
  it "will add a new question" do
    question = FactoryGirl.create(:question)
    visit '/'
    click_link 'New Question'
    fill_in 'Option A', with: question.option_a
    fill_in 'Option B', with: question.option_b
    click_on 'Create Question'
    expect(page).to have_content 'eat cat poop'
  end

  it "gives error when a field is left blank" do
    visit new_question_path
    click_on "Create Question"
    expect(page).to have_content 'Please fix these errors:'
  end
end

describe "upvoting an answer" do
  it "Will add a vote to an answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit '/'
    login(user)
    click_on 'eat cat poop'
    expect(page).to have_content "Upvote added to eat cat poop"
  end

  it "Will allow user to select other answer when answer has already been selected" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit '/'
    login(user)
    click_on 'eat dog poop'
    expect(page).to have_content "Upvote added to eat dog poop"
  end
end

describe 'deleting a question' do
  it 'will delete a question' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    login(user)
    click_link '(remove)'
    expect(page).to have_content 'Would you rather'
  end
end
