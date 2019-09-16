require 'rails_helper'
RSpec.feature 'login ' do 
	before do 
		@user =  create(:user)
	end
	scenario 'home page after login ' do
		log_in @user
		home_view_for_auth_user
		log_in_user_visit_home_page 
		log_in_user_visit_all_event_page
		log_in_user_visit_create_events_page
		log_in_user_visit_his_events
		log_in_user_visit_logout
	end
	def home_view_for_auth_user 
		 expect(current_path).to eql root_path
		 expect(page).to have_link('Main')
		 expect(page).to have_link('All the events')
		 expect(page).to have_link('Create event')
		 expect(page).to have_link('Your events')
		 expect(page).to have_link('Log out')
	end

	def log_in_user_visit_home_page
		click_link 'Main'
		expect(current_path).to eql root_path 
	end
	def log_in_user_visit_all_event_page
		click_link 'All the events'
		expect(current_path).to eql events_path
	end
	def log_in_user_visit_create_events_page
		click_link 'Create event'
		expect(current_path).to eql new_event_path
	end
	def log_in_user_visit_his_events
		click_link 'Your events'
		expect(current_path).to eql users_path(@user.id)
	end
	def log_in_user_visit_logout
		click_link 'Log out'
		expect(current_path).to eql root_path
	end
end