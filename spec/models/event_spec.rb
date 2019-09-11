require 'rails_helper'
RSpec.describe Event, type: :model do
  before(:all) do 
	@user=create(:user)
  end
  describe 'associations' do
	it { should belong_to(:user).class_name('User') }

	it "It must enable user to create event" do
		user_create_event=create(:event, event_title: "my title", description: 'my description was too short so i decided to add some more content', date: '11/11/2019',user_id: @user.id)
		expect(user_create_event).to be_valid
	end

	end

	describe '.past' do 
		it 'test past events in event controller' do
			past_event_one = create(:event, event_title: "my title", description: "This is dumb description written for the sake of testing", date: DateTime.now - 1.week,user_id: @user.id)
			past_event_two = create(:event, event_title: "my title", description: "This is dumb description written for the sake of testing", date: DateTime.now - 2.week,user_id: @user.id)     
			past_event_three = create(:event, event_title: "my title", description: "This is dumb description written for the sake of testing", date: DateTime.now - 3.week,user_id: @user.id)
			expect(described_class.past).to contain_exactly(past_event_one,past_event_two,past_event_three)
		end
	end 
	describe '.upcoming' do 
		it 'test upcoming events in event controller' do
			upcoming_one = create(:event, event_title: "my title", description: "This is dumb description written for the sake of testing", date: DateTime.now + 1.week,user_id: @user.id)
			upcoming_two = create(:event, event_title: "my title", description: "This is dumb description written for the sake of testing", date: DateTime.now + 2.week,user_id: @user.id)     
			upcoming_three = create(:event, event_title: "my title", description: "This is dumb description written for the sake of testing", date: DateTime.now + 3.week,user_id: @user.id)
			expect(described_class.upcoming).to contain_exactly(upcoming_one,upcoming_two,upcoming_three)
		end
	end

  describe ' validation' do 

	it" Event title must not be empty" do 
	  title_of_event = build(:event , event_title: '')
	  expect(title_of_event).not_to be_valid
	end
	
	it" Event description must not be empty" do 
	  event_description = build(:event , description: '')
	  expect(event_description).not_to be_valid
	end
	
	it" Event date must not be empty" do 
	  event_date = build(:event , date: '')
	  expect(event_date).not_to be_valid
	end

	it "Is invalid if characters is less than 20" do
		char= "a" * 19
		description_length=build(:event, description: char)
		expect(description_length).not_to be_valid 
	end

	it "Is valid if character is more than 19 characters" do
		char= "a" * 20
		description_length=build(:event, description: char)
		expect(description_length).to be_valid 
	end
	
 end
end