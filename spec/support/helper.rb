module SpecTestHelper
	def log_in(user)
		visit new_sessions_path 
		fill_in 'session[email]', :with => user.email
		click_button 'login'
		expect(page).to have_text('you are logged in')
	end 
end