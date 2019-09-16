require 'rails_helper' 

RSpec.feature 'A user visits the home page' do 
  
	scenario 'home page before login' do 
		user_visits_home_page
		user_clicks_main_link
		user_clicks_all_events_link
		user_clicks_sign_up_link
		user_clicks_log_in_link	
	end

	def user_visits_home_page
		visit root_path
		expect(page).to have_link('Main')
		expect(page).to have_link('All the events')
		expect(page).to have_link('Sign up')
		expect(page).to have_link('Log in')
	end
	def user_clicks_main_link 
		click_link 'Main'
		expect(current_path).to eql root_path
	end
	
	
	def user_clicks_all_events_link 
		click_link 'All the events'
		expect(current_path).to eql events_path
	end


	def user_clicks_sign_up_link
		click_link 'Sign up'
		expect(current_path).to eql new_users_path
	end

	def user_clicks_log_in_link 
		click_link 'Log in'
		expect(current_path).to eql login_path
	end

end