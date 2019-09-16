require 'rails_helper'
RSpec.feature 'Sign up' do
	scenario 'visit and sign up' do 
		visit new_users_path
		fill_in 'user[name]', :with => 'Kofi'
		fill_in 'user[email]', :with => 'kofi@gmail.com'
		fill_in 'user[password]', :with => 'qwertyuiop'
		fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
		click_button 'create'
    
		expect(page).to have_text('Welcome to Eventia !')
	end
end 