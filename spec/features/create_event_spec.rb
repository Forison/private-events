require 'rails_helper'

RSpec.feature 'auth user create events' do 
	before do 
		@user = create(:user)
		@auth_user = log_in @user
	end

	scenario 'fill event creation form' do 
		visit new_event_path
		fill_in 'event[event_title]', :with => 'awesome title'
		fill_in 'event[date]', :with => '12/10/2019'
		fill_in 'event[description]', :with => 'awesome descripton for the sake of testing for test adding more test'
		click_button 'create'
		expect(page).to have_text('Event created successfully!')
	end
end