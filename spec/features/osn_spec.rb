require 'rails_helper'

feature 'OSN' do
  scenario 'User can visit osn page directly' do
    visit osn_path

  end
end
