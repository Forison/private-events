require 'rails_helper'
RSpec.describe Attendance, type: :model do 
	before(:all) do 
		@user = create(:user)
		@event = create(:event)
		@attend = create(:attendance)
	end

	describe "Associations " do 
		it { should belong_to(:user).class_name('User') }
		it { should belong_to(:event).class_name('Event') }
	end

end