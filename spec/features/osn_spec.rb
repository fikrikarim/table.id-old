require 'rails_helper'

feature 'OSN' do
  scenario 'User can visit osn page directly' do
    visit osn_path
  end

  scenario 'OSN Competition banner on home page' do
    visit root_path
    expect(page).to have_link('OSN Short Story Competition', href: osn_path)
  end
  pending 'Test the OSN page'
end
