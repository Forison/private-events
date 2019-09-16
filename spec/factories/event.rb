FactoryBot.define do 
  factory :event, aliases: [:attended_event], class: 'Event' do 
    sequence(:event_title) { |n| "This is the title #{n}" }
    sequence(:description) { |n| "This is random text from the random dude #{n}" }
    sequence(:date) { |n| "#{n}/12/2019" }
    user_id {1}
  end
end